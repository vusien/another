// ignore_for_file: unnecessary_import, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taverna/cutouts/custom_text.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  const Color.fromARGB(255, 197, 164, 136),
       appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(
              Icons.logout_rounded,
              size: 35,
              color: Color.fromARGB(255, 99, 66, 39)
            )
          )
        ],
        backgroundColor:  const Color.fromARGB(255, 179, 141, 108),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
        ),
        centerTitle: true,
        title: Text(
          "Ваш выбор?",
          style: CustomText.myTextStyleLarge(),
        ),
       ),
       body: SingleChildScrollView(
         child: SafeArea(
           child: Padding(
             padding: const EdgeInsets.only(top: 35,left: 20, right: 20),
             child: Center(
               child: Column(
                 children: [
                   GestureDetector(
                    onTap:() {
                      Navigator.pushNamed(context, '/adminAddItemTitleScreen');
                    },
                     child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)
                        ),
                        child: SizedBox(
                          height: 150,
                          width: 350,
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
                                    'images/settings.jpg',
                                  ),
                                  colorFilter: const ColorFilter.mode(Color.fromARGB(255, 97, 61, 41), BlendMode.hue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                                  child: Container(
                                      child: Text(
                                        "Добавить позицию",
                                        style: CustomText.myTextStyleSilver(),
                                      ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                   ),
                   const SizedBox(height: 25),
                   GestureDetector(
                    onTap:() {
                      // Navigator.pushNamed(context, '/adminAddItemScreen');
                    },
                     child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)
                        ),
                        child: SizedBox(
                          height: 150,
                          width: 350,
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
                                    'images/admin_editing.jpg',
                                  ),
                                  colorFilter: const ColorFilter.mode(Color.fromARGB(255, 97, 61, 41), BlendMode.hue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                                  child: Container(
                                      child: Text(
                                        "Изменить позицию",
                                        style: CustomText.myTextStyleSilver(),
                                      ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                   ),
                 ],
               ),
             ),
             
           ),
         ),
       ),
    );
  }
}