import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneplay/pages/auth/SignUp.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _LoginformKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      // pop the loading circle
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      if(mounted){
        Navigator.pop(context);
      }
      
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
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
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
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
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: const Text(
                              'Welcome back! Login',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Form(
                            key: _LoginformKey,
                            child: Column(
                              children: <Widget>[
                                // Mobile number field
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: TextFormField(
                                    controller: _emailController,
                                    key: const ValueKey('email'),
                                    decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      labelText: 'Email',
                                      hintText: 'Enter your email',
                                    ),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'email is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                // Password field
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    key: const ValueKey('password'),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Enter your password',
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password is required';
                                      } else if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15),
                                // Confirm password field

                                // Sign up button
                                ElevatedButton(
                                  onPressed: () {
                                    signUserIn();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color.fromARGB(
                                        255, 47, 119, 126), // Change text color
                                    minimumSize: const Size(
                                        237, 50), // Set width and height
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)), // Change border radius
                                  ),
                                  child: const Text('LOGIN'),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                // Already login link
                                TextButton(
                                  onPressed: () {
                                    // Navigate to the login page using Navigator.push()
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()));
                                  },
                                  child: const Text(
                                      'You do not have an account? Signup'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
