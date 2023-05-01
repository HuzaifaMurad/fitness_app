import 'dart:developer';

import 'package:fitness_king/view/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: const Offset(3, 3),
                ),
              ],
              image: const DecorationImage(
                  image: AssetImage(
                    'images/dumbell.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.fitness_center,
                          size: 40,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'FITNESS KING',
                          style: GoogleFonts.kanit(
                              color: Colors.white, fontSize: 40),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      height: 150,
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomButton(
                            title: 'Sign in with google',
                            imgUrl: 'images/google.png',
                          ),
                          CustomButton(
                              title: 'Sign in with facebook',
                              imgUrl: 'images/facebook.png')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'sign in below',
                      style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black54,
                          ),
                          height: 300,
                          width: 350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customTextBoxL(
                                title: 'Enter your email',
                                hint: 'Enter your email',
                                controller: emailController,
                              ),
                              customTextBoxL(
                                title: 'Enter your password',
                                hint: 'Enter your password',
                                controller: passwordController,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: InkWell(
                                  onTap: () async {
                                    try {
                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text);
                                      final user =
                                          FirebaseAuth.instance.currentUser!;
                                      log(user.uid);
                                      Get.to(() => const SplashScreen());
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        print('No user found for that email.');
                                      } else if (e.code == 'wrong-password') {
                                        print(
                                            'Wrong password provided for that user.');
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 320,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SignUp',
                                        style: GoogleFonts.kanit(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'forget password?',
                                      style: GoogleFonts.kanit(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Register',
                                      style: GoogleFonts.kanit(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 170,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.arrow_downward),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class customTextBoxL extends StatelessWidget {
  customTextBoxL(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller})
      : super(key: key);
  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        cursorHeight: 20,
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey[900],
          label: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.title, required this.imgUrl})
      : super(key: key);
  String title;
  String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  imgUrl,
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
