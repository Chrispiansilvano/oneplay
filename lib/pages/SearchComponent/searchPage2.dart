// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:oneplay/pages/MediaView/MediaPlayerPage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MyAppState();
}

class _MyAppState extends State<Search> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              )),
          backgroundColor: const Color.fromARGB(255, 20, 62, 87),
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            // Adjust height as needed
            decoration: BoxDecoration(
              color: Colors.blueGrey[800], // Dark blue background
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      onChanged: (val) {
                        setState(
                          () {
                            name = val;
                          },
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Search movies, tv shows, series, ...',
                        hintStyle: TextStyle(
                            color: Colors.white70), // Light gray hint text
                        border: InputBorder.none, // Remove borders
                      ),
                      style: TextStyle(color: Colors.white), // White text
                      // onChanged: onSearch, // Update on user input
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search,
                      color: Colors.white), // Search icon
                  onPressed: () {}, // Handle search button press (optional)
                ),
              ],
            ),
          )),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin:
                Alignment.topCenter, // Adjust as desired (top left by default)
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Movies').snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshots.hasError) {
              return Text('Error: ${snapshots.error}');
            }
            final movies = snapshots.data!.docs
                .map((doc) => doc.data() as Map<String, dynamic>)
                .toList();
            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final String movieId = snapshots.data!.docs[index].id;

                  final String thumbnailUrl = movie['ThumbnailUrl'];
                  Future<String> getDownloadUrl() async {
                    final storageRef =
                        FirebaseStorage.instance.ref(thumbnailUrl);
                    final String downloadUrl =
                        await storageRef.getDownloadURL();
                    return downloadUrl;
                  }

                  if (name.isEmpty) {
                    return GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: MediaPlayerPage(
                            id: movieId,
                          ),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: ListTile(
                        title: Text(
                          movie['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          movie['Released year'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: FutureBuilder<String>(
                          future: getDownloadUrl(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final downloadUrl = snapshot.data!;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  downloadUrl,
                                  height: 170,
                                  // width: double.infinity,
                                  width: 120,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: Container(
                                        height: 170,
                                        width: 120,
                                        decoration: const BoxDecoration(
                                          // color: Color.fromARGB(170, 56, 31, 56),
                                          color:
                                              Color.fromARGB(255, 17, 41, 54),
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, trace) =>
                                      const Center(child: Icon(Icons.error)),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                  'Error loading image: ${snapshot.error}');
                            } else {
                              return Container(
                                height: 170,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 17, 41, 54),
                                ),
                              );
                              // CircularProgressIndicator(
                              //   color: Colors.yellow,
                              // );
                            }
                          },
                        ),
                      ),
                    );
                  }

                  if (movie['title']
                      .toString()
                      .toLowerCase()
                      .startsWith(name.toLowerCase())) {
                    return GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: MediaPlayerPage(
                            id: movieId,
                          ),
                          withNavBar: true,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: ListTile(
                        title: Text(
                          movie['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          movie['Released year'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage(data['image']),
                        // ),
                        leading: FutureBuilder<String>(
                          future: getDownloadUrl(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final downloadUrl = snapshot.data!;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  downloadUrl,
                                  height: 170,
                                  // width: double.infinity,
                                  width: 120,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: Container(
                                        height: 170,
                                        width: 120,
                                        decoration: const BoxDecoration(
                                          // color: Color.fromARGB(170, 56, 31, 56),
                                          color:
                                              Color.fromARGB(255, 17, 41, 54),
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
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                  'Error loading image: ${snapshot.error}');
                            } else {
                              return Container(
                                height: 170,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 17, 41, 54),
                                ),
                              );
                              // CircularProgressIndicator(
                              //   color: Colors.yellow,
                              // );
                            }
                          },
                        ),
                      ),
                    );
                  }
                  return Container();
                });
          },
        ),
      ),
    );
  }
}
