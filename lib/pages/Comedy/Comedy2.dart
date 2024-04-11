import 'package:flutter/material.dart';

class ComedyExtra extends StatefulWidget {
  const ComedyExtra({super.key});

  @override
  State<ComedyExtra> createState() => _ComedyState();
}

class _ComedyState extends State<ComedyExtra> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              //   child: const Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       'Trending Now',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w800,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 180.0,
                        child: ClipRRect(
                          child: Image.asset(
                            'images/ngalawa.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: const Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                'Demu akikufanyia hivi utarudia tena? shughudia, will you do it again ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 15),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
                              child: Text(
                                '6.9M views',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 231, 220, 220),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                              child: Text(
                                '3 hrs ago',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 231, 220, 220),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 180.0,
                        child: ClipRRect(
                          child: Image.asset(
                            'images/ngalawa.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: const Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                'Demu akikufanyia hivi utarudia tena? shughudia, will you do it again ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 15),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
                              child: Text(
                                '6.9M views',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 231, 220, 220),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                              child: Text(
                                '3 hrs ago',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 231, 220, 220),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
