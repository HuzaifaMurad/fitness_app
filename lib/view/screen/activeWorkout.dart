// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:fitness_king/view/widgets/activeworkoutItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/DispExercise_controller.dart';
import '../widgets/WorkoutItem.dart';

class ActiveWorkoutScreen extends StatelessWidget {
  final String imgUrl;
  final int index;
  final String title;
  ActiveWorkoutScreen(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.index})
      : super(key: key);
  DispExerciseController display = Get.find();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Hero(
                    tag: 'heros$index',
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height / 2.66,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xDD163A40),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: width * 0.95,
                      height: height * 0.13,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              title,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomTiles(
                                  icon: Icons.alarm_sharp,
                                  title: 'minutes',
                                ),
                                const CustomTiles(
                                    icon: Icons.bar_chart,
                                    title: 'intermidate'),
                                const CustomTiles(
                                    icon: Icons.fitness_center_sharp,
                                    title: 'workout'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ActiveWorkoutItem(
                    title: display.option.value[index].name!,
                    img: display.option.value[index].imageUrl!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
