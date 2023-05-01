// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_king/view/onboarding/screen/onborading.dart';
import 'package:fitness_king/view/screen/loginscreen.dart';
import 'package:get/get.dart';

import '../widgets/exercise_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseScreen extends StatefulWidget {
  static const routeName = '/exercise-screen';

  ExerciseScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   callapiData();
  // }

  // callapiData() async {
  //   NetworkHelper.getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerScrimColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://cdn2.vectorstock.com/i/1000x1000/14/11/round-avatar-icon-symbol-character-image-vector-16831411.jpg'),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text('Max'),
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.orange),
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text('SignUp'),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Membership',
                  style: GoogleFonts.romanesco(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  )),
              onTap: () {
                Get.to(() => OnBoardingScreen());
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'About Us',
                style: GoogleFonts.romanesco(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.indigo[900]),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: GoogleFonts.oswald(
                  color: Colors.indigo[800],
                ),
                children: [
                  TextSpan(text: 'Find Your '),
                  TextSpan(
                    text: '\nYour Favorite Workout',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final data = {
                    'title': [
                      'BodyBuilding',
                      'Cardio',
                    ],
                    'workout': [
                      '12 workout',
                      '10 workout',
                    ],
                    'mints': [
                      '60 mints',
                      '30 mints',
                    ],
                    'img': ['images/jugg.png', 'images/cardio.png']
                  };
                  return ExerciseItems(
                    title: data['title']![index],
                    workout: data['workout']![index],
                    hours: data['mints']![index],
                    imges: data['img']![index],
                  );
                },
                itemCount: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
