import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  String _username = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _getCurrentUser(); // Fetch user info on page load
  }

  // void _getCurrentUser() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     setState(() {
  //       _username = user.displayName??
  //           ''; // Use null-ish coalescing for optional display name
  //       _email = user.email!; // Email is guaranteed to be non-null
  //     });
  //   }
  // }
  void _getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;

      // Fetch user document from Firestore based on UID
      final docSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      if (docSnapshot.exists) {
        final userData = docSnapshot.data();
        setState(() {
          _username = userData?['username'] ??
              ''; // Use null-ish coalescing for both levels
          _email = user.email!;
        });
      } else {
        // Handle case where user document is not found
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 30, 48),
          // leading: Container(
          //   // padding: const EdgeInsets.all(5),
          //   padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          //   child: Image.asset(
          //     'images/logo.png',

          //     // height: 60,
          //   ),
          // ),
          // title: Title(
          //   color: const Color.fromARGB(255, 38, 174, 42),
          //   child: const Text(
          //     'My Oneplay',
          //     style: TextStyle(
          //         fontSize: 25,
          //         color: Colors.white,
          //         fontWeight: FontWeight.w600),
          //   ),
          // ),
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
        body: ListView(children: [
          Container(
            decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 239, 241, 241),
                // color: Color.fromARGB(255, 233, 237, 237),
                ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 2, 30, 48),
                      // color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(child: Text('OP')),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                _username,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Container(
                              child: Text(
                                _email,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.94,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 57, 32, 58),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: IconTheme(
                            data: IconThemeData(
                                // weight: 100,
                                ),
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 20,
                              // weight: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Text(
                            "Settings",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                        //   child: IconTheme(
                        //     data: IconThemeData(

                        //         ),
                        //     child: Icon(
                        //       Icons.chevron_right,
                        //       color: Colors.white,
                        //       size: 20,

                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.94,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 57, 32, 58),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: IconTheme(
                          data: IconThemeData(
                              // weight: 100,
                              ),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 20,
                            // weight: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Text(
                          "Notification",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      // Expanded(
                      //   flex: 1,
                      //   child: Padding(
                      //     padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                      //     child: IconTheme(
                      //       data: IconThemeData(
                      //           // weight: 100,
                      //           ),
                      //       child: Icon(
                      //         Icons.chevron_right,
                      //         color: Colors.white,
                      //         size: 20,
                      //         // weight: 20,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.94,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 57, 32, 58),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: IconTheme(
                          data: IconThemeData(
                              // weight: 100,
                              ),
                          child: Icon(
                            Icons.help,
                            color: Colors.white,
                            size: 20,
                            // weight: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Text(
                          "Help",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      // Expanded(
                      //   flex: 1,
                      //   child: Padding(
                      //     padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                      //     child: IconTheme(
                      //       data: IconThemeData(
                      //           // weight: 100,
                      //           ),
                      //       child: Icon(
                      //         Icons.chevron_right,
                      //         color: Colors.white,
                      //         size: 20,
                      //         // weight: 20,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.94,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(255, 57, 32, 58),
                      borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  )),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // Set background color
                      backgroundColor: const Color.fromARGB(255, 57, 32, 58),
                      // Set shape (optional, uncomment if desired)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: signUserOut,
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: IconTheme(
                            data: IconThemeData(
                                // weight: 100,
                                ),
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 20,
                              // weight: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Text(
                            "Signout",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
