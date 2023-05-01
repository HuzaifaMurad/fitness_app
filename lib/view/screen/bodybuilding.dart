import 'package:fitness_king/view/screen/activeWorkout.dart';
import 'package:fitness_king/view/screen/cardioScreen.dart';
import 'package:fitness_king/view/screen/videoscreen.dart';
import 'package:fitness_king/view/screen/workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widgets/popover.dart';

class BodyBuildingScreen extends StatefulWidget {
  final bool isCardio;
  const BodyBuildingScreen({
    Key? key,
    required this.isCardio,
  }) : super(key: key);

  @override
  State<BodyBuildingScreen> createState() => _BodyBuildingScreenState();
}

class _BodyBuildingScreenState extends State<BodyBuildingScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const url = 'https://www.youtube.com/watch?v=j6UyNq_TwGA';
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags:
            const YoutubePlayerFlags(mute: false, loop: false, autoPlay: true));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: heights / 2,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                      color: Colors.grey,
                    ),
                    child: Image.asset(
                      'images/bodybuilding.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 5,
                    child: Text(
                      widget.isCardio ? 'Cardio' : 'Muscle',
                      style: GoogleFonts.lato(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {},
                      label: const Text('25 min'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: const BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daniel Robertson',
                      style: GoogleFonts.almarai(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.amber.withOpacity(0.3),
                      child: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'fitness  Coach    -   3  more  lessons',
                  style: GoogleFonts.almarai(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    if (widget.isCardio == true) {
                      Get.to(() => CardioScreen());
                    } else {
                      Get.to(() => WorkoutOptionScreen());
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Colors.lightBlue, Colors.purple, Colors.pink],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Let\'s Go',
                        style: GoogleFonts.almarai(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Popover(
                          child: Expanded(
                            child: YoutubePlayerBuilder(
                              player: YoutubePlayer(
                                controller: controller,
                                onReady: () {
                                  setState(() {});
                                },
                              ),
                              builder: (p0, p1) => Scaffold(
                                backgroundColor: Colors.blueGrey[900],
                                body: ListView(
                                  children: [
                                    p1,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey[900],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Preview',
                          style: GoogleFonts.almarai(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less norma',
                  style: GoogleFonts.almarai(
                      fontSize: 13,
                      wordSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
