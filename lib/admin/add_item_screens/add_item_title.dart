import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taverna/cutouts/custom_text.dart';
import 'package:random_string/random_string.dart';
import 'package:taverna/database.dart';

class AddItemTitle extends StatefulWidget {
  const AddItemTitle({super.key});

  @override
  State<AddItemTitle> createState() => _AddItemTitleState();
}

class _AddItemTitleState extends State<AddItemTitle> {


  
  var formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  
  final List<String> categories = ['Сладкое', 'Острое', 'Закуски', 'Кофейное', 'Напиток'];
  String? value;
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _timecontroller = TextEditingController();
  TextEditingController _detailcontroller = TextEditingController();
  
  uploadItem() async {
    if (selectedImage != null &&
        _namecontroller.text != "" &&
        _timecontroller.text != "" &&
        _detailcontroller.text != "") {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child("cardImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": _namecontroller.text,
        "Price": _timecontroller.text,
        "Detail": _detailcontroller.text
      };
      await DatabaseMethods().addItem(addItem, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color.fromARGB(255, 156, 116, 62),
            content: Text(
              "Позиция была успешно добавлена",
              style: TextStyle(fontSize: 18.0),
            )));
      });
    }
  }


  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {
      
    });
  }
  

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
                "Главное",
                style: CustomText.myTextStyleLarge(),
              ),

              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 186, 141),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Добавьте название позиции",
                      hintStyle: CustomText.myTextStyleHintText(),
                      ),
                ),
              ),

              const SizedBox(height: 20.0),
              selectedImage==null? GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Center(
                  child: Material(
                    borderRadius: BorderRadius.circular(45),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 190, 146),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(45),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              size: 45,
                              Icons.upload_file_outlined,
                              color: Color.fromARGB(195, 110, 73, 40),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Добавьте фото позиции из своей галереи',
                              style: CustomText.myTextStyleSmall(),
                            ),
                          ],
                        ),
                      ), 
                    ),
                  ),
                ),
              ): Center(
                child: Material(
                  borderRadius: BorderRadius.circular(45),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 190, 146),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: Image.file(
                              selectedImage! ,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ), 
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 190, 146),
                    borderRadius: BorderRadius.circular(45)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  items: categories
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: CustomText.myTextStyleSmall(),
                          )
                        )
                      ).toList(),
                  onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                  dropdownColor: const Color.fromARGB(255, 240, 190, 146),
                  hint: const Text("Выберите категорию"),
                  iconSize: 36,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromARGB(255, 46, 22, 7),
                  ),
                  value: value,
                )),
              ),

              const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: GestureDetector(
                    onTap:() {
                      Navigator.pushNamed(context, '/adminAddItemInformationScreen');
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 156, 112, 73),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: const Color.fromARGB(255, 156, 112, 73),
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