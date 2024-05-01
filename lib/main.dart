// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taverna/admin/add_item_screens/add_ingridients.dart';
import 'package:taverna/admin/add_item_screens/add_item_information.dart';
import 'package:taverna/admin/add_item_screens/add_item_instructions.dart';
import 'package:taverna/admin/add_item_screens/add_item_title.dart';
import 'package:taverna/admin/admin_home_screen.dart';
import 'package:taverna/admin/admin_login_screen.dart';
import 'package:taverna/auth_state.dart';
import 'package:taverna/firebase_options.dart';
import 'package:taverna/users/app_screens/details/details_ingridients.dart';
import 'package:taverna/users/app_screens/details/details_instructions.dart';
import 'package:taverna/users/app_screens/details/main_details.dart';
import 'package:taverna/users/app_screens/user_home_screen.dart';
import 'package:taverna/users/authentication/forgot_password.dart';
import 'package:taverna/users/authentication/intro_screens/user_login_screen.dart';
import 'package:taverna/users/authentication/intro_screens/user_register_screen.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // AuthState
      home:  AdminHomeScreen(),


      routes: {
        '/userLoginScreen' :(context) => const UserLoginScreen(),
        '/userRegistrationScreen' :(context) => const UserRegisterScreen(),
        '/adminLoginScreen' :(context) => const AdminLoginScreen(),
        '/authStateScreen' :(context) => const AuthState(),
        '/detailsIngridientsCard' :(context) => DetailsIngridientsCard(),
        '/detailsInstructionsCard' :(context) => DetailsInstructionsCard(),
        '/userHomeScreen' :(context) => const UserHomeScreen(),
        '/adminHomeScreen' :(context) => const AdminHomeScreen(),
        '/adminAddItemTitleScreen' :(context) => const AddItemTitle(),
        '/adminAddItemInformationScreen' :(context) => const AddItemInformation(),
        '/adminAddItemInstructionsScreen' :(context) => const AddItemInstructions(),
        '/adminAddItemIngridientsScreen' :(context) => const AddItemIngridients(),
        '/forgotPasswordScreen' :(context) => const ForgotPassword(),
        
        

      },

      
     );
  }
}
