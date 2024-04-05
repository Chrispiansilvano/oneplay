import 'package:flutter/material.dart';

class SuccessPaid extends StatelessWidget {
  const SuccessPaid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 62, 87),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
      ),
      body: Container(
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
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Congratulations!!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("You've successfully subscribed",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(
                  height: 30,
                ),
                Text("Enjoy!",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
