import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MediaPlayer extends StatelessWidget {
  MediaPlayer({super.key});

  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 32, 58),
        leading: Container(
          // padding: const EdgeInsets.all(5),
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
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
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: const Text(
                    "CHANDA",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: const Text(
                    "2022",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: const Text(
                    "1hr 54m",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: const Text(
                    "Action Thriller",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () => {},
                    child: const Text(
                      'save',
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
