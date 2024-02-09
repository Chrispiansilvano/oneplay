import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final myitems = [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: Image.asset(
          'images/huba.png',
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Image.asset(
          'images/chanda.png',
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: Image.asset(
          'images/kisanga.jpg',
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: Image.asset(
          'images/ngalawa.jpg',
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: Image.asset(
          'images/queenelizabeth.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ];
    return SingleChildScrollView(
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
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
          )
        ],
      ),
    );
  }
}
