import 'package:fitness_king/view/widgets/WorkoutItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutOptionScreen extends StatelessWidget {
  const WorkoutOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Fitness',
                  style: GoogleFonts.kanit(
                      color: Colors.teal[900],
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'King',
                  style: GoogleFonts.kanit(
                      color: Colors.blueGrey,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              'Popular Body fit',
              style: GoogleFonts.kanit(
                  color: Colors.teal[900],
                  fontSize: 32,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return WorkoutOptionItem(
                    index: index,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
