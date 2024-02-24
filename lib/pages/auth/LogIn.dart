import 'package:flutter/material.dart';
import 'package:oneplay/pages/auth/SignUp.dart';
// import 'package:nk_cng_auto/UI/Profile.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LoginState();
}

class _LoginState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Center(
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.15,
                // width: MediaQuery.of(context).size.width * 0.40,
                margin: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                child: ClipOval(
                  child: Image.asset(
                    "images/nklogo.png",
                    height: 120,
                    width: 500,
                    scale: 1,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email_rounded),
                    // hintText: 'What do people call you?',
                    labelText: 'Enter your email',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  // validator: (String? value) {
                  //   return (value != null && value.contains('@'))
                  //       ? 'Do not use the @ char.'
                  //       : null;
                  // },
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    // hintText: 'What do people call you?',
                    labelText: 'Enter your password',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  // validator: (String? value) {
                  //   return (value != null && value.contains('@'))
                  //       ? 'Do not use the @ char.'
                  //       : null;
                  // },
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    child: const Text(
                      "Forgot password ?",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                width: MediaQuery.of(context).size.width * 0.50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  child: Container(
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          ],
        ),
      ),
    );
  }
}
