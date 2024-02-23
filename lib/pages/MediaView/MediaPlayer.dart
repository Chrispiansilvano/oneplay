import 'package:flutter/material.dart';

class MediaPlayer extends StatelessWidget {
  const MediaPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: const Center(
          child: Text(
            "This is the media player widget",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ));
  }
}
