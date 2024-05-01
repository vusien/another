// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taverna/cutouts/custom_text.dart';
import 'package:taverna/users/app_screens/details/details_ingridients.dart';

class MainDetailsCard extends StatefulWidget {
  const MainDetailsCard({ super.key });

  @override
  State<MainDetailsCard> createState() => _MainDetailsCardState();
}

class _MainDetailsCardState extends State<MainDetailsCard> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 212, 175),
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 216, 168, 127),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
             bottomRight: Radius.circular(15)
          )
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10,left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 25),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: SizedBox(
                    height: 250,
                    width: 365,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(144, 58, 30, 8),
                              Color.fromARGB(52, 58, 30, 8),
                              ])
                          ),
                          child: Ink.image(
                            fit: BoxFit.cover,
                            image: const AssetImage(
                              'images/hot_chocolade.jpg',
                            ),
                            colorFilter: const ColorFilter.mode(Color.fromARGB(255, 97, 61, 41), BlendMode.hue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      size: 15,
                                      Icons.timelapse,
                                      color:Color.fromARGB(255, 255, 241, 236),
                                    ), 
                                    Text(
                                    " 20 мин.",
                                    style: CustomText.myTextStyleSmallItemCard()
                                    ),
                                  ],
                                ),
                                
                                Text(
                                  "Какао на молоке",
                                  style: CustomText.myTextStyleItemCard(),
                                ),
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      Text(
                        "Описание", 
                        style: CustomText.myTextStyleMedium(),
                      ),
                      Text(
                        "Напиток появился более 3000 лет назад на побережье Мексики.\nПервыми, кто стали употреблять какао-бобы в пищу, были индейцы Майя — они перетирали какао-бобы в порошок и разводили их водой с добавлением острого перца.\nЕвропа узнала о горячем шоколаде в 16 веке, благодаря испанскому мореплавателю Эрнандо Кортесу", 
                        style: CustomText.myTextStyleSmall(),
                      ),
                    ],
                  ),
                ),
        
        
        
                const SizedBox(height: 25),
                GestureDetector(
                  onTap:() {
                    Navigator.pushNamed(context, '/detailsIngridientsCard');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 116, 83, 41),
                      border: Border.all(color: const Color.fromARGB(255, 138, 102, 56),),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Material(
                      color: const Color.fromARGB(255, 116, 83, 41),
                      child: Form(
                        key: formKey,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Далее',
                                    style: GoogleFonts.cormorantGaramond(
                                      color: Colors.white70,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                  ),
                                  const Icon(
                                        size: 30,
                                        Icons.navigate_next,
                                        color:Colors.white70,
                                  ),
                                ],
                              ),
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}