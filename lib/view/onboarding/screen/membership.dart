import 'dart:developer';

import 'package:fitness_king/controller/GymMember.dart';
import 'package:fitness_king/modal/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widget/custom_heading.dart';
import '../widget/custom_textfield.dart';

class Membership extends StatefulWidget {
  const Membership({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  GymMemberController member = Get.put(GymMemberController());
  final _formKey = GlobalKey<FormState>();
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.teal;
    }
    return Colors.teal;
  }

  bool ischeck = false;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Become a member ... You will enjoy exclusive deals offers invites and reward',
                  softWrap: true,
                  style: GoogleFonts.lateef(fontSize: 24),
                ),
              ),
              const Divider(thickness: 1, indent: 30, endIndent: 30),
              const Custom_heading(title: 'Name :'),
              Custom_textformfield(
                title: 'Eneter your name',
                controller: nameController,
              ),
              const Custom_heading(title: 'Email:'),
              Custom_textformfield(
                title: 'Enter your email',
                controller: emailController,
              ),
              const Custom_heading(title: 'Password:'),
              Custom_textformfield(
                title: 'Enter Your password',
                show: true,
                controller: passwordController,
              ),
              const Custom_heading(title: 'Phone'),
              Custom_textformfield(
                title: 'Enter Your Phone ',
                controller: phoneController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: ischeck,
                      onChanged: (value) {
                        setState(() {
                          ischeck = value!;
                        });
                      }),
                  Expanded(
                    child: Text(
                      'subscripe to latest news and notification',
                      softWrap: true,
                      style: GoogleFonts.lateef(fontSize: 24),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: (() {
                      widget.tabController
                          .animateTo(widget.tabController.index - 1);
                    }),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Expanded(
                    child: StepProgressIndicator(
                      totalSteps: 3,
                      currentStep: 2,
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
                      GymUser user = GymUser(
                        email: emailController.text,
                        id: 'abx',
                        name: nameController.text,
                        password: passwordController.text,
                        phone: phoneController.value.text,
                      );

                      member.addNewMember(user);

                      // log("${user.name} this is print");
                      // print('${nameController.text} asdfg');
                      widget.tabController
                          .animateTo(widget.tabController.index + 1);
                    }),
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
