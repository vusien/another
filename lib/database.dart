import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  
  Future addItem(Map<String, dynamic>userInfoMap, String id) async{
    return await FirebaseFirestore.instance.collection('name').add(userInfoMap);
  }

}