import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oneplay/main.dart';
import 'package:oneplay/pages/auth/LogIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpformKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      final username = _userNameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      // Create user with Firebase Authentication
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Extract the user ID
      final uid = userCredential.user!.uid;

      // Add user details to Firestore
      await FirebaseFirestore.instance.collection('Users').doc(uid).set({
        'uid': uid,
        'email': email,
        'username': username,
      });
      if (mounted) {
        Navigator.pop(context);
      }

      // Navigate to home page (replace with your actual home page)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } on FirebaseAuthException catch (e) {
      // Handle signup errors (e.g., show a snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
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
                    height: MediaQuery.of(context).size.height * 0.60,
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
                            'Welcome, Create Account',
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
                          key: _signUpformKey,
                          child: Column(
                            children: <Widget>[
                              // Mobile number field
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: TextFormField(
                                  controller: _userNameController,
                                  key: const ValueKey('Username'),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    labelText: 'Username',
                                    hintText: 'Enter your username',
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'username is required';
                                    }
                                    return null;
                                  },
                                  // onSaved: (value) => _mobileNumber = value!,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: TextFormField(
                                  controller: _emailController,
                                  key: const ValueKey('Email'),
                                  decoration: InputDecoration(
                                    isDense: true,
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
                                    hintText: 'Enter your Email',
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email is required';
                                    }
                                    return null;
                                  },
                                  // onSaved: (value) => _mobileNumber = value!,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              // Password field
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: TextFormField(
                                  controller: _passwordController,
                                  key: const ValueKey('password'),
                                  decoration: InputDecoration(
                                    isDense: true,
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
                                  // onSaved: (value) => password = value!,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Confirm password field
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: TextFormField(
                                  controller: _confirmPasswordController,
                                  key: const ValueKey('confirmPassword'),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Confirm Password',
                                    hintText: 'Confirm your password',
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
                                      return 'Confirm password is required';
                                    } else if (value !=
                                        _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // Sign up button
                              ElevatedButton(
                                onPressed: () async {
                                  _registerUser();
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color.fromARGB(
                                      255, 87, 191, 255), // Change text color
                                  minimumSize: const Size(
                                      237, 50), // Set width and height
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0)), // Change border radius
                                ),
                                child: const Text('S I G N U P'),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // Already login link
                              TextButton(
                                onPressed: () {
                                  // Navigate to login page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LogIn()));
                                },
                                child: const Text(
                                    'Already have an account? Login'),
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
          ),
        ),
      ),
    );
  }
}
