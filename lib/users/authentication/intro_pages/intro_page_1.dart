// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class IntroPage1 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor:  Color.fromARGB(255, 167, 137, 94),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        
        child: Image.asset('images/login_image1.jpg',fit: BoxFit.cover),
        
      ),
    );
  }
}