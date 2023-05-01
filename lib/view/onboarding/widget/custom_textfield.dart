import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_textformfield extends StatelessWidget {
  Custom_textformfield({
    Key? key,
    required this.title,
    required this.controller,
    this.show = false,
  }) : super(key: key);
  final String title;
  bool show;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: show,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            hintText: title,
            filled: true,
            contentPadding: const EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(50.0),
            )),
        onSubmitted: (value) {
          if (value == '') {
            Get.snackbar(
              'Alert',
              ' $title should not be empty',
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            );
          }
        },
      ),
    );
  }
}
