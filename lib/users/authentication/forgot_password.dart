import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taverna/cutouts/custom_text.dart';
import 'package:taverna/users/authentication/intro_screens/user_login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailcontroller = new TextEditingController();

  String email = "";

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Сообщение отправлено",
        style: CustomText.myTextStyleMedium(),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Мы не нашли никого с такой почтой",
          style: CustomText.myTextStyleMedium(),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 165, 127),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 70.0,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Восстановление пароля",
                  style: CustomText.myTextStyleLarge(),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Введите вашу электронную почту",
                style: CustomText.myTextStyleMedium(),
              ),
              Expanded(
                  child: Form(
                    key: _formkey,
                      child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 180, 151, 114),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: mailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'введите свой email';
                          }
                          return null;
                        },
                        style: TextStyle(color: Color.fromARGB(255, 128, 80, 39)),
                        decoration: InputDecoration(
                            hintText: "введите свой email",
                            
                            hintStyle: CustomText.myTextStyleMedium(),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 128, 80, 39),
                              size: 30.0,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: (){
                      if(_formkey.currentState!.validate()){
                        setState(() {
                          email= mailcontroller.text;
                        });
                        resetPassword();
                      }
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 116, 83, 41),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Отправить",
                            style: GoogleFonts.cormorantGaramond(
                                    color: Colors.white70,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "У вас нету аккаунтa?",
                          style: CustomText.myTextStyleSmall(),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserLoginScreen()));
                          },
                          child: Text(
                            " Зарегистрируйтесь",
                            style: TextStyle(
                            color: Color.fromARGB(255, 112, 45, 14),
                            fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))),
            ],
          ),
        ),
      ),
    );
  }
}