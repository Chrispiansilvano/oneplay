import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:oneplay/pages/Reels/Content_screen.dart';

class Reels extends StatelessWidget {
  const Reels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // ContentScreen(src: '',),
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return const ContentScreen(
                    src:
                        'https://i.pinimg.com/236x/c8/4f/af/c84faf6336070c89ebdb784fb8f77211.jpg');
              },
              itemCount: 5,
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
