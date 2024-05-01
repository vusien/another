import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taverna/users/app_screens/user_home_screen.dart';
import 'package:taverna/users/authentication/intro_pages/on_board.dart';


class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const UserHomeScreen();
          }
          else {
            return const OnBoardScreen();
          }
        }, 
      ),
    );
  }
}