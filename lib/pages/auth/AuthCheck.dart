import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneplay/main.dart';
import 'package:oneplay/pages/auth/LogIn.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is looged in
            if (snapshot.hasData) {
              return const MyHomePage();
            }
            //user is not logged in
            else {
              return const LogIn();
            }
          }),
    );
  }
}
