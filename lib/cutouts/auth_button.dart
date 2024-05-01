import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AuthButton extends StatelessWidget {
  final Function()? onTap;

  const AuthButton ({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
  var formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
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
    );
  }
}