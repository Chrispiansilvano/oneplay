import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int myCurrentIndex = 0;
  Future<List<String>>? _imageNamesFuture;
  //function to get reference to an image
  Reference getStorageImageRef(String path) {
    final storage = FirebaseStorage.instance;
    return storage.ref().child('Home/Thumbnails/HotMovies/$path');
  }

  //funct that takes a reference of an image and returns a ImageProvider future
  Future<ImageProvider> getImageProvider(Reference imageRef) async {
    final downloadUrl = await imageRef.getDownloadURL();
    return NetworkImage(downloadUrl);
  }

  Future<ImageProvider> _getImageProvider(Reference imageRef) async {
    final downloadUrl = await imageRef.getDownloadURL();
    return NetworkImage(downloadUrl);
  }

  Future<List<String>> getStorageImageNames() async {
    final ref =
        FirebaseStorage.instance.ref().child('Home/Thumbnails/HotMovies');
    final listResult = await ref.listAll();
    final imagePaths = listResult.items.map((itemRef) => itemRef.name).toList();
    return imagePaths;
  }

  @override
  void initState() {
    super.initState();
    _imageNamesFuture = getStorageImageNames();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _imageNamesFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final imageNames = snapshot.data!;
              return Column(
                children: [
                  CarouselSlider(
                    items: imageNames
                        .map((imageName) => _buildImageItem(imageName))
                        .toList(),
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
                    count: snapshot.data?.length ?? 0,
                    effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 10,
                      dotColor: Color.fromARGB(255, 226, 226, 226),
                      activeDotColor: Color.fromARGB(255, 47, 119, 126),
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Widget _buildImageItem(String imageName) {
    final imageRef = getStorageImageRef(imageName);
    return FutureBuilder<ImageProvider>(
      future: _getImageProvider(imageRef),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200.0, // Adjust height as needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: snapshot.data!,
                fit: BoxFit.cover, // Adjust fit as needed
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
