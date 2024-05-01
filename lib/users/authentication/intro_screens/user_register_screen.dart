// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:taverna/cutouts/auth_button.dart';
import 'package:taverna/cutouts/custom_text.dart';


class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {

  var isObscure = true.obs;
  final _emailController = TextEditingController();
  var nameController = TextEditingController();
  final _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  

  void signUpFirebase() async {

    showDialog(
      context: context,
       builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                'Регистрация',
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
                  validator:(val) => val == '' ? 'Пожалуйста, введите Ваше Имя' : null,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Имя',
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
                child: TextFormField(
                  validator:(val) => val == '' ? 'Пожалуйста, введите email' : null,
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

          SizedBox(height: 25),
          AuthButton(onTap: signUpFirebase),

          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('У Вас уже есть аккаунт?'),
              GestureDetector(
                onTap: () {
                    Navigator.pushNamed(context, '/userLoginScreen');
                  },
                child: Text('Войти в свой аккаунт', style: TextStyle(
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