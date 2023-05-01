import 'package:fitness_king/network/network_helper.dart';
import 'package:fitness_king/view/screen/exercise.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkHelper.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/splashscreen.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Fitness',
                        style: GoogleFonts.kanit(
                            color: Colors.teal[900],
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'King',
                        style: GoogleFonts.kanit(
                            color: Colors.blueGrey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          );
        }
        return ExerciseScreen();
      },
    );
  }
}
