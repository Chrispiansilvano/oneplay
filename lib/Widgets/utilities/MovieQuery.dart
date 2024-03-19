import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:oneplay/pages/MediaView/TrailerPage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MovieList extends StatefulWidget {
  final String tag; // Tag to filter by (e.g., "Trending Now")

  const MovieList({super.key, required this.tag});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Stream<QuerySnapshot>? moviesStream;
  Stream<QuerySnapshot> getMoviesByTag(String tag) {
    return FirebaseFirestore.instance
        .collection('Movies')
        .where('Tags', arrayContains: tag)
        .snapshots();
  }

  @override
  void initState() {
    super.initState();
    moviesStream = getMoviesByTag(widget.tag); // Get movies by tag
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: moviesStream!,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // print('Error: ${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return const CircularProgressIndicator(
            color: Color.fromARGB(255, 255, 0, 0),
          );
        }

        final movies = snapshot.data!.docs;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Two movies per row
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: 200,
          ),
          itemCount: movies.length,
          // itemCount: 5,
          itemBuilder: (context, index) {
            final Map<String, dynamic> movieData =
                movies[index].data() as Map<String, dynamic>;

            final String thumbnailUrl = movieData['ThumbnailUrl'];

            Future<String> getDownloadUrl() async {
              final storageRef = FirebaseStorage.instance.ref(thumbnailUrl);
              final String downloadUrl = await storageRef.getDownloadURL();
              return downloadUrl;
            }

            // final title = movieSnapshot.get('title');
            final id = movies[index].id; // Extract movie ID
            return FutureBuilder<String>(
              future: getDownloadUrl(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final downloadUrl = snapshot.data!;
                  return GestureDetector(
                    // onTap: () => MediaPlayer(id: id,),

                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: TrailerPage(
                          id: id,
                        ),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Container(
                      // Adjusted from Container for flexibility
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // color: Colors.amberAccent.shade100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              downloadUrl,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return  Center(
                                  child:  Container(
                    height: 170,
                    width: 200,
                    decoration: const BoxDecoration(color: Color.fromARGB(170, 56, 31, 56)),
                  ),
                                  // CircularProgressIndicator(
                                  //   color: Colors.green,
                                  // ),
                                );
                              },
                              errorBuilder: (context, error, trace) =>
                                  const Center(child: Icon(Icons.error)),
                            ),
                          ),
                          Text(
                            movieData['title'],
                            style: const TextStyle(color: Colors.white),
                          ), // Use title from movieData
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading image: ${snapshot.error}');
                } else {
                  return Container(
                    height: 120,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 57, 32, 58)),
                  );
                  // CircularProgressIndicator(
                  //   color: Colors.yellow,
                  // );
                }
              },
            );
          },
        );
      },
    );
  }
}
