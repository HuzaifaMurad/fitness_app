// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ActiveWorkoutItem extends StatelessWidget {
  const ActiveWorkoutItem({Key? key, required this.title, required this.img})
      : super(key: key);

  final String title;
  final String img;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.15,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: SizedBox(
                  width: 200,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 200,
                child: Text(
                  'It is a long established fact that a readerwill be distracted  by the readable content of a page when looking  at its layout.',
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 25,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.teal[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '5 min',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
