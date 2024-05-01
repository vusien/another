// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 137, 94),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        child: Image.asset('images/login_image2.jpg',fit: BoxFit.cover),

      ),
    );
  }
}