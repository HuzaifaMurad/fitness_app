import 'package:fitness_king/view/onboarding/screen/Start.dart';
import 'package:fitness_king/view/onboarding/screen/membership.dart';
import 'package:fitness_king/view/onboarding/screen/payment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const List<Tab> tabs = [
    Tab(
      text: 'Start',
    ),
    Tab(
      text: 'Membership',
    ),
    Tab(
      text: 'Payment',
    )
  ];

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: OnBoardingScreen.tabs.length,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(
            () {
              if (tabController.indexIsChanging) {}
            },
          );

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
            body: (TabBarView(
              children: [
                Start(
                  tabController: tabController,
                ),
                Membership(
                  tabController: tabController,
                ),
                Payment(tabController: tabController)
              ],
            )),
          );
        },
      ),
    );
  }
}
