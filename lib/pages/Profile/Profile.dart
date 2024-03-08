import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 57, 32, 58),
          // leading: Container(
          //   // padding: const EdgeInsets.all(5),
          //   padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          //   child: Image.asset(
          //     'images/logo.png',

          //     // height: 60,
          //   ),
          // ),
          title: Title(
            color: const Color.fromARGB(255, 38, 174, 42),
            child: const Text(
              'My Oneplay',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
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
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 57, 32, 58),
                      // color: Colors.black45,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: -70,
                        left: 8,
                        right: 8,
                        top: 20,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const OrderConversionScreen()),
                    // );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.94,
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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
