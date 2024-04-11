import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:oneplay/pages/Comedy/ComedyPlayer.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ComedyList extends StatefulWidget {
  final String tag; // Tag to filter by (e.g., "Trending Now")

  const ComedyList({super.key, required this.tag});

  @override
  _ComedyListState createState() => _ComedyListState();
}

class _ComedyListState extends State<ComedyList> {
  Stream<QuerySnapshot>? comedyStream;
  Stream<QuerySnapshot> getComedyByTag(String tag) {
    return FirebaseFirestore.instance
        .collection('Comedy')
        .where('Tags', arrayContains: tag)
        .snapshots();
  }

  @override
  void initState() {
    super.initState();
    comedyStream = getComedyByTag(widget.tag); // Get movies by tag
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: comedyStream!,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // print('Error: ${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromARGB(255, 17, 41, 54),
            ),
          );
        }

        final comedies = snapshot.data!.docs;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Two movies per row
            // crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: 260,
          ),
          itemCount: comedies.length,
          // itemCount: 5,
          itemBuilder: (context, index) {
            final Map<String, dynamic> comedyData =
                comedies[index].data() as Map<String, dynamic>;

            final String thumbnailUrl = comedyData['ThumbnailUrl'];

            Future<String> getDownloadUrl() async {
              final storageRef = FirebaseStorage.instance.ref(thumbnailUrl);
              final String downloadUrl = await storageRef.getDownloadURL();
              return downloadUrl;
            }

            // final title = movieSnapshot.get('title');
            final id = comedies[index].id; // Extract movie ID
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
                        screen: ComedyPlayerPage(
                          id: id,
                        ),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Container(
                      // Ajusted from Container for flexibility
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 17, 41, 54),
                        borderRadius: BorderRadius.circular(0),
                        // color: Colors.amberAccent.shade100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: Image.network(
                              downloadUrl,
                              height: 190,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: Container(
                                    height: 170,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      // color: Color.fromARGB(170, 56, 31, 56),
                                      color: Color.fromARGB(255, 17, 41, 54),
                                    ),
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
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              comedyData['description'],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ), // Use title from movieData
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  comedyData['Views'],
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 193, 193, 193)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Views",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 193, 193, 193)),
                                ),
                                // const SizedBox(
                                //   width: 40,
                                // ),
                                // Text(
                                //   comedyData['Views'],
                                //   style: const TextStyle(color: Colors.white),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading image: ${snapshot.error}');
                } else {
                  return Column(
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 17, 41, 54),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 25,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 17, 41, 54),
                        ),
                      ),
                    ],
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
