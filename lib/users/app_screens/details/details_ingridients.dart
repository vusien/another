import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taverna/cutouts/custom_text.dart';

class DetailsIngridientsCard extends StatefulWidget {
  const DetailsIngridientsCard({ Key? key }) : super(key: key);

  @override
  State<DetailsIngridientsCard> createState() => _DetailsIngridientsCardState();
}

class _DetailsIngridientsCardState extends State<DetailsIngridientsCard> {
  
  var formKey = GlobalKey<FormState>();
  bool isChecked = false;


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
        
                // card of chosen Item 
        
        
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
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
        
                // text
        
                const SizedBox(height: 25),
                Text(
                  "Ингридиенты",
                  style: CustomText.myTextStyleMedium(),
                  ),
                Text(
                  "пожалуйста, подготовьте ингридиенты",
                  style: CustomText.myTextStyleSmall(),
                ),
        
        
        
                // ingrident cards with check box
        
                const SizedBox(height: 25),
                ingridentCard(),

                // next button

                const SizedBox(height: 25),
                GestureDetector(
                  onTap:() {
                    Navigator.pushNamed(context, '/detailsInstructionsCard');
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
  Widget ingridentCard(){
    return Column(
      children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              color: const Color.fromARGB(255, 241, 183, 132),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        children: [
                          const Icon(
                          size: 40,
                          Icons.info_outline_rounded,
                          color: Color.fromARGB(255, 138, 95, 66),
                          ),
                          Text(
                          "\tмолоко",
                          style: CustomText.myTextStyleCategoriesRow(),
                          ),
                          const Spacer(),
                          Text(
                          "1 литр\t",
                          style: CustomText.myTextStyleSmall(),
                          ),               
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
            Ink(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                // GestureDetector(
                //   onTap: () {
                //     isChecked = true;
                //   },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: isChecked? const Color.fromARGB(255, 138, 95, 66): const Color.fromARGB(255, 247, 191, 143),
                    ),
                    child: Icon(
                      size: 25,
                      Icons.check,
                      color: isChecked? const Color.fromARGB(255, 247, 191, 143): const Color.fromARGB(255, 138, 95, 66),
                    ),
                  ),
                ),
            )
            
          ],
        ),
      
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              color: const Color.fromARGB(255, 241, 183, 132),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        children: [
                          const Icon(
                          size: 40,
                          Icons.info_outline_rounded,
                          color: Color.fromARGB(255, 138, 95, 66),
                          ),
                          Text(
                          "\tкакао",
                          style: CustomText.myTextStyleCategoriesRow(),
                          ),
                          const Spacer(),
                          Text(
                          "5 ч. л\t",
                          style: CustomText.myTextStyleSmall(),
                          ),               
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
            Ink(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: isChecked? const Color.fromARGB(255, 138, 95, 66): const Color.fromARGB(255, 247, 191, 143),
                  ),
                  child: Icon(
                    size: 25,
                    Icons.check,
                    color: isChecked? const Color.fromARGB(255, 247, 191, 143): const Color.fromARGB(255, 138, 95, 66),
                  ),
                ),
              ),
            ),
          ],
        ),
      
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              color: const Color.fromARGB(255, 241, 183, 132),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        children: [
                          const Icon(
                          size: 40,
                          Icons.info_outline_rounded,
                          color: Color.fromARGB(255, 138, 95, 66),
                          ),
                          Text(
                          "\tсахар",
                          style: CustomText.myTextStyleCategoriesRow(),
                          ),
                          const Spacer(),
                          Text(
                          "5 ч. л\t",
                          style: CustomText.myTextStyleSmall(),
                          ),               
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
            Ink(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: isChecked? const Color.fromARGB(255, 138, 95, 66): const Color.fromARGB(255, 247, 191, 143),
                  ),
                  child: Icon(
                    size: 25,
                    Icons.check,
                    color: isChecked? const Color.fromARGB(255, 247, 191, 143): const Color.fromARGB(255, 138, 95, 66),
                  ),
                ),
              ),
            ),
          ],
        )
      ]
    );
  }
}