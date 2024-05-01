import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taverna/cutouts/custom_text.dart';

class AddItemInformation extends StatefulWidget {
  const AddItemInformation({super.key});

  @override
  State<AddItemInformation> createState() => _AddItemInformationState();
}

class _AddItemInformationState extends State<AddItemInformation> {

  var formKey = GlobalKey<FormState>();
  TextEditingController _timecontroller = TextEditingController();
  TextEditingController _detailcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 198, 166),
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 216, 168, 127),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
             bottomRight: Radius.circular(15)
          )
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color.fromARGB(255, 61, 35, 14)
            )),
        centerTitle: true,
        title: Text(
          "Добавить позицию",
          style: CustomText.myTextStyleMedium(),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom:40.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Информация",
              style: CustomText.myTextStyleLarge(),
            ),

            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 181, 136),
                  borderRadius: BorderRadius.circular(40)),
                child: TextField(
                  controller: _detailcontroller,
                  maxLines: 9,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "О позиции",
                    hintStyle: CustomText.myTextStyleHintText(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Время приготовления',
                style: CustomText.myTextStyleMedium(),),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 186, 141),
                    borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    controller: _timecontroller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "0 с.",
                      hintStyle: CustomText.myTextStyleHintText(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: GestureDetector(
                onTap:() {
                  Navigator.pushNamed(context, '/adminAddItemIngridientsScreen');
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 156, 112, 73),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Material(
                    color: Color.fromARGB(255, 156, 112, 73),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}