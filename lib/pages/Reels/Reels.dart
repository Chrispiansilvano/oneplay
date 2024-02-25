import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:oneplay/pages/Reels/Content_screen.dart';

class Reels extends StatelessWidget {
  final List<String> videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];

  Reels({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // ContentScreen(src: '',),
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ContentScreen(src: videos[index]);
              },
              itemCount: videos.length,
              scrollDirection: Axis.vertical,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reels',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class Reels extends StatelessWidget {
//   const Reels({super.key});

//   @override
//   Widget build(BuildContext context) {
//     PageController controller = PageController(initialPage: 0);

//     List<Widget> reel = [
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.green,
//         child: const Center(
//           child: Text(
//             "Reel 1",
//           ),
//         ),
//       ),
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.blue,
//         child: const Center(child: Text("Reel 2")),
//       ),
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.yellow,
//         child: const Center(child: Text("Reel 3")),
//       ),
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.grey[200],
//         child: const Center(child: Text("Reel 4")),
//       ),
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.blue,
//         child: const Center(child: Text("Reel 5")),
//       ),
//     ];
//     return Container(
//         child: PageView(
//       scrollDirection: Axis.vertical,
//       controller: controller,
//       children: reel,
//     ));
//   }
// }
