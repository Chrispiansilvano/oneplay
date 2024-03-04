import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oneplay/pages/Providers/Providers.dart';
import 'package:oneplay/pages/auth/LogIn.dart';
import 'package:oneplay/pages/auth/aws_auth.dart';

class SignUp extends ConsumerWidget {
  final _signUpformKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  SignUp({super.key});

  // @override
  // void dispose() {
  //   _userNameController.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _confirmPasswordController.dispose();
  //   dispose();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: TextFormField(
                                controller: _userNameController,
                                key: const ValueKey('Username'),
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  labelText: 'Username',
                                  hintText: 'Enter your Username',
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username is required';
                                  }
                                  return null;
                                },
                                // onSaved: (value) => _mobileNumber = value!,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: TextFormField(
                                controller: _emailController,
                                key: const ValueKey('Email'),
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
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
                              height: 15,
                            ),
                            // Password field
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: TextFormField(
                                controller: _passwordController,
                                key: const ValueKey('password'),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
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
                            const SizedBox(height: 15),
                            // Confirm password field
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: TextFormField(
                                controller: _confirmPasswordController,
                                key: const ValueKey('confirmPassword'),
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  hintText: 'Confirm your password',
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
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
                                if (_signUpformKey.currentState!.validate()) {
                                  _signUpformKey.currentState!.save();
                                  // Process signup logic with `_mobileNumber` and `_password`
                                  final authService = ref.read(
                                      authServiceProvider); // Read the AuthServices instance
                                  await authService.signUpUser(
                                    username: username,
                                    email: email,
                                    password: password,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color.fromARGB(
                                    255, 47, 119, 126), // Change text color
                                minimumSize:
                                    const Size(237, 50), // Set width and height
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0)), // Change border radius
                              ),
                              child: const Text('SIGNUP'),
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
                              child:
                                  const Text('Already have an account? Login'),
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
    );
  }
}
