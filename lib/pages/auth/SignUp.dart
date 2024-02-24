import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Container(
          // padding: const EdgeInsets.all(5),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Image.asset(
            'images/logo.png',
            height: 60,
          ),
        ),
        Container(
          // padding: const EdgeInsets.all(5),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: const Text(
            'O n e p l a y',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Container(
          // padding: const EdgeInsets.all(5),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
          child: const Text(
            'Your gateway to endless Entertinment',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 223, 221, 221)),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width * 0.80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: const Text(
                  'Welcome, Create Account',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
