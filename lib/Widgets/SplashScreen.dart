import 'package:flutter/material.dart';
import 'package:oneplay/pages/auth/AuthCheck.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const AuthCheck()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin:
                Alignment.topCenter, // Adjust as desired (top left by default)
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
        child: Center(
          child: Image.asset(
            'images/mainlogo.png',

            // height: 60,
          ),
        ),
      ),
    );
  }
}
