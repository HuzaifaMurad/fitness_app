// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:fitness_king/controller/DispExercise_controller.dart';
import 'package:fitness_king/modal/exercise.dart';
import 'package:fitness_king/network/network_helper.dart';
import 'package:fitness_king/view/screen/activeWorkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutOptionItem extends StatelessWidget {
  final int index;
  WorkoutOptionItem({Key? key, required this.index}) : super(key: key);
  DispExerciseController display = Get.put(DispExerciseController());

  void assigningIntoCategory(String part, bool check) {
    var len = Exercise.allExercise.length;

    if (check == true) {
      var chest =
          Exercise.allExercise.where((element) => element.target == part);

      display.option.value = chest.toList();
    } else {
      var chest =
          Exercise.allExercise.where((element) => element.bodyPart == part);

      display.option.value = chest.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (() {
        if (display.exerciseList.value[index].title == 'chest') {
          assigningIntoCategory('chest', false);
        } else if (display.exerciseList.value[index].title == 'Wings') {
          assigningIntoCategory('back', false);
        } else if (display.exerciseList.value[index].title == 'biceps') {
          assigningIntoCategory('biceps', true);
        } else if (display.exerciseList.value[index].title == 'triceps') {
          assigningIntoCategory('triceps', true);
        } else if (display.exerciseList.value[index].title == 'legs') {
          assigningIntoCategory('upper legs', false);
        } else {
          assigningIntoCategory('shoulders', false);
        }

        Get.to(() => ActiveWorkoutScreen(
              imgUrl: display.exerciseList.value[index].imageUrl!,
              index: index,
              title: display.exerciseList.value[index].title!,
            ));
      }),
      child: Stack(
        children: [
          Hero(
            tag: 'heros$index',
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              height: height * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  display.exerciseList.value[index].imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xDD163A40),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: width * 0.87,
                height: height * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Text(
                        display.exerciseList.value[index].title!,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            CustomTiles(
                              icon: Icons.alarm_sharp,
                              title: display.exerciseList.value[index].time!,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            CustomTiles(
                                icon: Icons.bar_chart,
                                title:
                                    display.exerciseList.value[index].level!),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTiles extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomTiles({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
          ),
          Text(
            title,
            style: GoogleFonts.lato(color: Colors.teal),
          )
        ],
      ),
    );
  }
}
