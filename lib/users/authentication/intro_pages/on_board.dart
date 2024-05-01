// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taverna/users/authentication/intro_pages/intro_page_1.dart';
import 'package:taverna/users/authentication/intro_pages/intro_page_2.dart';
import 'package:taverna/users/authentication/intro_pages/intro_page_3.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {

PageController _controller = PageController();
// ignore: non_constant_identifier_names
bool OnLastPage = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                OnLastPage = (index == 2);
              });
              
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OnLastPage
                ?
                GestureDetector(
                  child: Text("           ")
                  )
                  :
                  GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/userLoginScreen');
                  },
                  child: Text("Пропустить",
                  style: GoogleFonts.cormorantGaramond(
                  color: Color.fromARGB(255, 44, 26, 22),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  ),)
                  ),



                SmoothPageIndicator(
                  
                  controller: _controller,
                  count: 3,
                  effect: SlideEffect(
                  activeDotColor: Color.fromARGB(255, 255, 208, 122),
                  dotColor: Color.fromARGB(31, 71, 43, 2),
                 ),
                ),

                OnLastPage
                 ? GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/userLoginScreen');
                  },
                  child: Text("Вход",
                  style: GoogleFonts.cormorantGaramond(
                  color: Color.fromARGB(255, 44, 26, 22),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  ),)
                  )
                  :
                  GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                       curve: Curves.easeInCirc,
                       );
                  },
                  child: Text("Далее",
                  style: GoogleFonts.cormorantGaramond(
                  color: Color.fromARGB(255, 44, 26, 22),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  ),)
                  ),

              ],
            ),
            ),
        ],
      ),
    );
  }
}