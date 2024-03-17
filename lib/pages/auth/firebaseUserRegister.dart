import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future addUserDetails( String displayName, String email,) async {
  await FirebaseFirestore.instance.collection('AppUsers').add({
     'email': email,
    'name': displayName,
   
  });
}

