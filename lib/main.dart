// ignore_for_file: prefer_const_constructors

import 'package:fitness_king/view/onboarding/screen/onborading.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_king/view/screen/loginscreen.dart';
import 'package:fitness_king/view/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.black),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
