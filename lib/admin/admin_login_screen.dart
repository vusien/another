import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taverna/admin/admin_home_screen.dart';
import 'package:taverna/cutouts/custom_text.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  
  var isObscure = true.obs;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 192, 165, 127),
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                'Админ',
                style: CustomText.myTextStyleLarge(),
                ),
            ),
          ),

          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 180, 151, 114),
                border: Border.all(color: const Color.fromARGB(255, 212, 189, 156),),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextFormField(
                  validator:(val) => val == '' ? 'Пожалуйста, введите Ваше Имя' : null,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Имя',
                    ),
                ),
              ),
            ),
          ),


          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 180, 151, 114),
                border: Border.all(color: const Color.fromARGB(255, 212, 189, 156),),
                borderRadius: BorderRadius.circular(20),
              ),
              
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Obx(
                  () =>
                    TextFormField(
                      controller: passwordController,
                      validator:(val) => val == '' ? 'Пожалуйста, введите пароль' : null,
                      obscureText: isObscure.value,
                      decoration: InputDecoration(
                        suffixIcon: Obx(
                          () => GestureDetector(
                            onTap: () {
                              isObscure.value = !isObscure.value;
                            },
                            child: Icon(
                              isObscure.value ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                              color: Colors.brown[700],
                            ),
                        ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Пароль',
                        ),
                    ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 95),
            child: Container(
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
                    onTap: () {
                      // if (formKey.currentState!.validate()) {
                      //   validateEmail();
                      // }
                      Fluttertoast.showToast(msg: "Добро пожаловать, Админ!");
                      Get.to(const AdminHomeScreen());
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Center(
                      child: Text(
                        'Готово',
                        style: GoogleFonts.cormorantGaramond(
                          color: Colors.white70,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Хотите вернуться на экран входа?'),
              GestureDetector(
                onTap: () {
                    Navigator.pushNamed(context, '/userLoginScreen');
                  },
                child: const Text('Вход в аккаунт', style: TextStyle(
                  color: Color.fromARGB(255, 112, 45, 14),
                  fontStyle: FontStyle.italic),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}