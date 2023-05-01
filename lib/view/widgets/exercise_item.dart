// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_king/view/screen/bodybuilding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ExerciseItems extends StatelessWidget {
  final String title;
  final String workout;
  final String hours;
  final String imges;
  ExerciseItems(
      {required this.title,
      required this.workout,
      required this.hours,
      required this.imges,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'BodyBuilding') {
          Get.to(() => BodyBuildingScreen(
                isCardio: false,
              ));
        } else {
          Get.to(() => BodyBuildingScreen(
                isCardio: true,
              ));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.fitness_center,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          workout,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          hours,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 160,
                width: 160,
                child: Image.asset(
                  imges,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
