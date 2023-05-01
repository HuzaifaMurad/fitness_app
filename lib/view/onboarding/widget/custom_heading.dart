import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_heading extends StatelessWidget {
  const Custom_heading({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23.0),
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.teal[900]),
      ),
    );
  }
}
