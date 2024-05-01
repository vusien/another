// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:taverna/cutouts/auth_button.dart';
import 'package:taverna/cutouts/custom_text.dart';




class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {

  var isObscure = true.obs;
  var formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();


  void signInFirebase() async {

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
        child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text
      );

      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {

      Navigator.pop(context);

      if (e.code == 'user-not-found') {

      Fluttertoast.showToast(msg: "Неверный адрес электронной почты");
      }
      else if (e.code == 'wrong-password') {

      Fluttertoast.showToast(msg: "Неверный пароль");
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 192, 165, 127),
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                'Вход',
                style: CustomText.myTextStyleLarge(),
                ),
            ),
          ),

          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 180, 151, 114),
                border: Border.all(color: Color.fromARGB(255, 212, 189, 156),),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    ),
                ),
              ),
            ),
          ),
          
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 180, 151, 114),
                border: Border.all(color: Color.fromARGB(255, 212, 189, 156),),
                borderRadius: BorderRadius.circular(20),
              ),
              
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Obx(
                  () =>
                    TextFormField(
                      controller: _passwordController,
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

          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/forgotPasswordScreen');
              },
              child: Text(
                'Забыли пароль?',
                style: TextStyle(
                color: Color.fromARGB(255, 112, 45, 14),
                fontStyle: FontStyle.italic),
              ),
            ),
          ),


          SizedBox(height: 25),
          AuthButton(onTap: signInFirebase),
          
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('У Вас нету аккаунта?'),
              GestureDetector(
                onTap: () {
                    Navigator.pushNamed(context, '/userRegistrationScreen');
                  },
                child: Text('Зарегистрируйтесь', style: TextStyle(
                  color: Color.fromARGB(255, 112, 45, 14),
                  fontStyle: FontStyle.italic),
                  ),
              ),
            ],
          ),

          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Вы администратор?'),
              GestureDetector(
                onTap: () {
                    Navigator.pushNamed(context, '/adminLoginScreen');
                  },
                child: Text('Войдите как Админ', style: TextStyle(
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

// String? emailInputValidator(value) {
//    if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                                 .hasMatch(value)) return 'Enter a valid email';
// }