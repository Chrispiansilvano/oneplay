import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  final myitems = [
    Image.asset('images/huba.png'),
    Image.asset('images/chanda.png'),
    Image.asset('images/kisanga.jpg'),
    Image.asset('images/ngalawa.jpg'),
    Image.asset('images/queenelizabeth.jpg'),
  ];
  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            items: myitems,
            options: CarouselOptions(
              autoPlay: true,
              height: 200,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    myCurrentIndex = index;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
