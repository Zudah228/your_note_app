import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  User({
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.iconURL,
    @required this.createAt,
  });
  User.fromDocument(DocumentSnapshot document) {
    uid = document.data()['uid'] as String;
    name = document.data()['name'] as String;
    email = document.data()['email'] as String;
    iconURL = document.data()['iconURL'] as String;
    createAt = document.data()['createAt'].toDate() as DateTime;
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'iconURL': iconURL,
      'createAt': createAt,
    };
  }

  String uid;
  String name;
  String email;
  String iconURL;
  DateTime createAt;
}
