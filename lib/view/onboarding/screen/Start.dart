import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Start extends StatelessWidget {
  final TabController tabController;
  const Start({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'Get Healthier yet more fun',
            style: GoogleFonts.lato(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
        ),
        SizedBox(
          height: 400,
          width: 350,
          child: Image.network(
            'https://w0.peakpx.com/wallpaper/328/370/HD-wallpaper-gym-goku-thumbnail.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution ',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w600, color: Colors.blueGrey),
            softWrap: true,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: (() {}),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Expanded(
              child: StepProgressIndicator(
                totalSteps: 3,
                currentStep: 1,
                size: 8,
                padding: 0,
                selectedColor: Colors.yellow,
                unselectedColor: Colors.cyan,
                roundedEdges: Radius.circular(10),
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.yellowAccent, Colors.deepOrange],
                ),
                unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.blue],
                ),
              ),
            ),
            IconButton(
              onPressed: (() {
                tabController.animateTo(tabController.index + 1);
              }),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ],
    );
  }
}
