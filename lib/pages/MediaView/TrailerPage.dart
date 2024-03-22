import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:oneplay/components/StorageService/storage_service.dart';
import 'package:video_player/video_player.dart';

class TrailerPage extends StatefulWidget {
  final String id; // Tag to filter by (e.g., "Trending Now")

  const TrailerPage({super.key, required this.id});

  @override
  State<TrailerPage> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<TrailerPage> {
  Future<Map<String, dynamic>>? movieDetailsFuture;
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    movieDetailsFuture = getMovieDetails(widget.id);
  }

  Future<Map<String, dynamic>> getMovieDetails(String movieId) async {
    final docRef = FirebaseFirestore.instance.collection('Movies').doc(movieId);
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      return snapshot.data()!;
    } else {
      throw Exception('Movie not found'); // Handle non-existent movie
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 30, 48),
        leading: Container(
          // padding: const EdgeInsets.all(5),
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              Icons.search,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment
                  .topCenter, // Adjust as desired (top left by default)
              end: Alignment
                  .bottomCenter, // Adjust as desired (bottom right by default)s
              colors: [
                Color.fromARGB(255, 20, 62, 87),
                Color.fromARGB(255, 15, 44, 61),
                Color.fromARGB(255, 13, 37, 52),
                Color.fromARGB(255, 10, 31, 44),
                Color.fromARGB(255, 7, 23, 33),
              ],
            ),
          ),
          child: Column(
            children: [
              FutureBuilder<Map<String, dynamic>>(
                  future: movieDetailsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final movieData = snapshot.data!;
                      final title = movieData['title'];
                      final description = movieData['Description'];
                      final cast = movieData['Cast']
                          as List<dynamic>; // Cast might be a list
                      final director = movieData['Director'];
                      final genre = movieData['Genre'];
                      final releaseYear = movieData['Released year'];
                    }
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return Container();
                  }),
              FutureBuilder<Map<String, dynamic>>(
                future: movieDetailsFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final movieData = snapshot.data!;
                    final trailerUrl = movieData['TrailerUrl'];
                    Future<String> getDownloadUrl() async {
                      final storageRef =
                          FirebaseStorage.instance.ref(trailerUrl);
                      final String downloadUrl =
                          await storageRef.getDownloadURL();
                      return downloadUrl;
                    }

                    if (trailerUrl != null) {
                      // print(trailerUrl);

                      return FutureBuilder<String>(
                        future: getDownloadUrl(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final downloadUrl = snapshot.data!;
                            return AspectRatio(
                              aspectRatio: 16 / 9,
                              child: FlickVideoPlayer(
                                  flickManager: FlickManager(
                                videoPlayerController:
                                    VideoPlayerController.networkUrl(
                                  Uri.parse(snapshot.data!),
                                ),
                              )),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                                'Error loading Trailer: ${snapshot.error}');
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      );
                    } else {
                      return const Text('No trailer available');
                    }
                  } else {
                    return Container(); // Avoid unnecessary widgets during loading/error
                  }
                },
              ),
              FutureBuilder(
                future: movieDetailsFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final movieData = snapshot.data!;
                    final title = movieData['title'];
                    final description = movieData['Description'];
                    final cast = movieData['Cast']
                        as List<dynamic>; // Cast might be a list
                    final director = movieData['Director'];
                    final genre = movieData['Genre'] as List<dynamic>;
                    final releaseYear = movieData['Released year'];
                    final likes = movieData['Likes'];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Text(
                                releaseYear,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 194, 194, 194),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                            //   child: const Text(
                            //     "1hr 54m",
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       color: Color.fromARGB(255, 194, 194, 194),
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            // ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Wrap(
                                children: genre
                                    .map((genre) => Text(
                                          '$genre ',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 194, 194, 194),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ))
                                    .toList(),
                              ),
                              // child: const Text(
                              //   "Action Thriller",
                              //   style: TextStyle(
                              //     fontSize: 15,
                              //     color: Color.fromARGB(255, 194, 194, 194),
                              //     fontWeight: FontWeight.w500,
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 47, 119, 126),
                                  // minimumSize: const Size(60, 35),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () => {},
                                child: Row(
                                  children: [
                                    const Icon(Icons.thumb_up_rounded),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                    ),
                                    Text(
                                      likes,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 47, 119, 126),
                                  // minimumSize: const Size(60, 35),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () => {},
                                child: const Row(
                                  children: [
                                    Icon(Icons.share),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                    ),
                                    Text(
                                      'Share',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 47, 119, 126),
                                  // minimumSize: const Size(65, 35),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () => {},
                                child: const Row(
                                  children: [
                                    Icon(Icons.download_rounded),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                    ),
                                    Text(
                                      'Download',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromARGB(255, 47, 119, 126),
                                // minimumSize: const Size(70, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () => {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: const Icon(Icons.play_arrow)),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  ),
                                  Container(
                                    child: const Text(
                                      'Play',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(description,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 3),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Cast',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Wrap(
                                    // Wrap for better overflow handling
                                    children: cast
                                        .map((actor) => Text(
                                              '$actor  ',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 194, 194, 194),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMovieDetails(Map<String, dynamic> movieData) {
    final title = movieData['title'];
    final description = movieData['Description'];
    final cast = movieData['Cast'] as List<dynamic>; // Cast might be a list
    final director = movieData['Director'];
    final genre = movieData['Genre'];
    final releaseYear = movieData['Released year'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Text(description),
        const Divider(),
        const Text('Cast:'),
        Wrap(
          // Wrap for better overflow handling
          children: cast.map((actor) => Text('$actor ')).toList(),
        ),
        const Divider(),
        Text('Director: $director'),
        const Divider(),
        const Text('Genre:'),
        Wrap(
          children: cast.map((genre) => Text('$genre ')).toList(),
        ),
        const Divider(),
        Text('Release Year: $releaseYear'),
      ],
    );
  }
}
