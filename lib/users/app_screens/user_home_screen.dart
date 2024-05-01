import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taverna/cutouts/custom_text.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {


  bool sweet = false,
  spicy = false,
  snacks = false,
  coffe = false,
  drinks = false;
  

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }


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
        centerTitle: true,
        title: Text(
          "Главная",
          style: CustomText.myTextStyleLarge()),
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(
            children: [
              // welcoming text
              Text(
                "Какие пожелания на сегодня?", 
                style: CustomText.myTextStyleLarge(),
              ),
              // horizontal row of categories for example sour sweet crispy etc.
              const SizedBox(height: 15),
              showCategoriesRow(),
              
              // drink chapter name  / view all message
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Интересное",
                    style: CustomText.myTextStyleMedium(),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, route);
                    },
                    child: Text(
                      "больше",
                      style: CustomText.myTextStyleSmall(),
                    ),
                  ),
                ],
              ),
        
        
              // image of a drink with its name over it
              const SizedBox(height: 25),
              showRowOfItemsCard(),
        
              
              // snack chapter name  / view all message
        
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Также смотрите",
                    style: CustomText.myTextStyleMedium(),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, route);
                    },
                    child: Text(
                      "больше",
                      style: CustomText.myTextStyleSmall(),
                    ),
                  ),
                ],
              ),
        
        
              // image of a snack with its name over it
              SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              child: SizedBox(
                height: 150,
                width: 250,
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
                        height: 150,
                        width: 250,
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
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              child: SizedBox(
                height: 150,
                width: 250,
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
                        height: 150,
                        width: 250,
                        fit: BoxFit.cover,
                        image: const AssetImage(
                          'images/butter_cookies.jpg',
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
                                " 3 часа.",
                                style: CustomText.myTextStyleSmallItemCard()
                                ),
                              ],
                            ),
                            
                            Text(
                              "Песочное печенье",
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
          ],
        ),
            )
        
        
        
        
              // bottom panel
        
        
            ],
          ),
        ),
      ),
    );
  }




  // image of a drink with its name over it
  Widget showRowOfItemsCard(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            child: SizedBox(
              height: 150,
              width: 250,
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
                      height: 150,
                      width: 250,
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
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            child: SizedBox(
              height: 150,
              width: 250,
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
                      height: 150,
                      width: 250,
                      fit: BoxFit.cover,
                      image: const AssetImage(
                        'images/butter_cookies.jpg',
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
                              " 3 часа.",
                              style: CustomText.myTextStyleSmallItemCard()
                              ),
                            ],
                          ),
                          
                          Text(
                            "Песочное печенье",
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
        ],
      ),
    );
  }





  // horizontal row of categories for example sour sweet crispy etc.
  Widget showCategoriesRow(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
            sweet = true;
            spicy = false;
            snacks = false;
            coffe = false;
            drinks = false;
            setState(() {
              
            });
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(left: 15, right: 3),
              decoration: BoxDecoration(
                color: sweet? const Color.fromARGB(255, 223, 156, 98) :const Color.fromARGB(255, 241, 183, 132),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Icon(
                    size: 35,
                    Icons.cookie,
                    color: sweet? const Color.fromARGB(255, 68, 42, 33):const Color.fromARGB(255, 102, 68, 56),
                  ),
                  Text(
                    "сладкое",
                    style: CustomText.myTextStyleCategoriesRow(),
                  )
                ]
              ),
            ),
          ),
          
          GestureDetector(
            onTap: (){
            sweet = false;
            spicy = true;
            snacks = false;
            coffe = false;
            drinks = false;
            setState(() {
              
            });
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(left: 15, right: 3),
              decoration: BoxDecoration(
                color: spicy? const Color.fromARGB(255, 223, 156, 98) :const Color.fromARGB(255, 241, 183, 132),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Icon(
                    size: 35,
                    Icons.local_fire_department,
                    color: spicy? const Color.fromARGB(255, 97, 32, 6):const Color.fromARGB(255, 150, 52, 13),
                  ),
                  Text(
                    "острое",
                    style: CustomText.myTextStyleCategoriesRow(),
                  )
                ]
              ),
            ),
          ),
          
          GestureDetector(
            onTap: (){
            sweet = false;
            spicy = false;
            snacks = true;
            coffe = false;
            drinks = false;
            setState(() {
              
            });
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(left: 15, right: 3),
              decoration: BoxDecoration(
                color: snacks? const Color.fromARGB(255, 223, 156, 98) :const Color.fromARGB(255, 241, 183, 132),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Icon(
                    size: 35,
                    Icons.lunch_dining,
                    color: snacks? const Color.fromARGB(255, 68, 42, 33):const Color.fromARGB(255, 102, 68, 56),
                  ),
                  Text(
                    "закуски",
                    style: CustomText.myTextStyleCategoriesRow(),
                  )
                ]
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
            sweet = false;
            spicy = false;
            snacks = false;
            coffe = true;
            drinks = false;
            setState(() {
              
            });
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(left: 15, right: 3),
              decoration: BoxDecoration(
                color: coffe? const Color.fromARGB(255, 223, 156, 98) :const Color.fromARGB(255, 241, 183, 132),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Icon(
                    size: 35,
                    Icons.coffee,
                    color: coffe? const Color.fromARGB(255, 68, 42, 33):const Color.fromARGB(255, 102, 68, 56),
                  ),
                  Text(
                    "кофейное",
                    style: CustomText.myTextStyleCategoriesRow(),
                  )
                ]
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
            sweet = false;
            spicy = false;
            snacks = false;
            coffe = false;
            drinks = true;
            setState(() {
              
            });
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(left: 15, right: 3),
              decoration: BoxDecoration(
                color: drinks? const Color.fromARGB(255, 223, 156, 98) :const Color.fromARGB(255, 241, 183, 132),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Icon(
                    size: 35,
                    Icons.local_bar,
                    color: drinks? const Color.fromARGB(255, 68, 42, 33):const Color.fromARGB(255, 102, 68, 56),
                  ),
                  Text(
                    "напитки",
                    style: CustomText.myTextStyleCategoriesRow(),
                  )
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}