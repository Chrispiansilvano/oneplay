import 'package:flutter/material.dart';
import 'package:oneplay/Widgets/Carousel.dart';
import 'package:oneplay/Widgets/utilities/MovieQuery.dart';
import 'package:oneplay/components/StorageService/storage_service.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Carousel(),
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
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: MovieList(tag: "Trending Now"),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Popular movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: MovieList(tag: "Popular Movies"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
