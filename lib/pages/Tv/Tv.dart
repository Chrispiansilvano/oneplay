import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Tv extends StatefulWidget {
  const Tv({super.key});

  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {
  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final myitems = [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'images/huba.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'images/chanda.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'images/kisanga.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'images/ngalawa.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'images/queenelizabeth.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 20, 62, 87),
          title: Title(
            color: const Color.fromARGB(255, 38, 174, 42),
            child: const Text(
              'Live Tv',
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
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  items: myitems,
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayInterval: const Duration(seconds: 4),
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          myCurrentIndex = index;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: myCurrentIndex,
                  count: myitems.length,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 10,
                    dotColor: Color.fromARGB(255, 226, 226, 226),
                    activeDotColor: Color.fromARGB(255, 47, 119, 126),
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Trending Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Chanda',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Huba',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Tears Forever',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
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
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Chanda',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Huba',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Tears Forever',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
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
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Chanda',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Huba',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 105,
                              height: 150.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'images/ngalawa.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
                              child: const Align(
                                // alignment: Alignment.centerLeft,
                                child: Text(
                                  'Tears Forever',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
