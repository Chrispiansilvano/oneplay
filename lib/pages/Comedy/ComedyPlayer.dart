import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:oneplay/components/StorageService/storage_service.dart';
import 'package:video_player/video_player.dart';

class ComedyPlayerPage extends StatefulWidget {
  final String id; // Tag to filter by (e.g., "Trending Now")

  const ComedyPlayerPage({super.key, required this.id});

  @override
  State<ComedyPlayerPage> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<ComedyPlayerPage> {
  Future<Map<String, dynamic>>? comedyDetailsFuture;
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    comedyDetailsFuture = getComedyDetails(widget.id);
  }

  Future<Map<String, dynamic>> getComedyDetails(String movieId) async {
    final docRef = FirebaseFirestore.instance.collection('Comedy').doc(movieId);
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      return snapshot.data()!;
    } else {
      throw Exception('Comedy not found'); // Handle non-existent movie
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
                  future: comedyDetailsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final comedyData = snapshot.data!;

                      final description = comedyData['description'];
                      // final cast = comedyData['Cast']
                      //     as List<dynamic>; // Cast might be a list
                      // final director = comedyData['Director'];
                      // final genre = comedyData['Genre'];
                      // final releaseYear = comedyData['Released year'];
                      final Views = comedyData['Views'];
                    }
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          // color: Color.fromARGB(170, 56, 31, 56),
                          color: Color.fromARGB(255, 17, 41, 54),
                        ),
                      );
                    }
                    return Container();
                  }),
              FutureBuilder<Map<String, dynamic>>(
                future: comedyDetailsFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final comedyData = snapshot.data!;
                    final trailerUrl = comedyData['ComedyUrl'];
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
                                'Error loading Comedy: ${snapshot.error}');
                          } else {
                            return Container(
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                // color: Color.fromARGB(170, 56, 31, 56),
                                color: Color.fromARGB(255, 17, 41, 54),
                              ),
                            );
                          }
                        },
                      );
                    } else {
                      return const Text('No Comedy available');
                    }
                  } else {
                    return Container(); // Avoid unnecessary widgets during loading/error
                  }
                },
              ),
              FutureBuilder(
                future: comedyDetailsFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final comedyData = snapshot.data!;
                    // final title = comedyData['title'];
                    final description = comedyData['description'];
                    // final cast = comedyData['Cast']
                    //     as List<dynamic>; // Cast might be a list
                    // final director = comedyData['Director'];
                    // final genre = comedyData['Genre'] as List<dynamic>;
                    // final releaseYear = comedyData['Released year'];
                    // final likes = comedyData['Likes'];
                    final Views = comedyData['Views'];
                    return Column(
                      children: [
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
                                      Views,
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
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            // color: Color.fromARGB(170, 56, 31, 56),
                            color: Color.fromARGB(255, 17, 41, 54),
                          ),
                        ),
                      ],
                    );
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
}
