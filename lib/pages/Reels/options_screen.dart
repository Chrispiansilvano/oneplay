import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        child: Icon(Icons.person, size: 18),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'Yope_boe',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.verified,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Follow',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 4,
                  // ),
                  const Text(
                    "When you enjoying touturing your..",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        'Original audio - Aston Martin truck',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                  const Text(
                    '607k',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.comment_rounded,
                    color: Colors.white,
                  ),
                  const Text(
                    '1123',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
