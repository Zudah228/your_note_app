import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Note {
  Note({
    this.id,
    this.tag,
    @required this.title,
    @required this.updateAt,
    @required this.description,
  });
  Note.fromDocument(DocumentSnapshot document) {
    id = document.id;
    tag = document.data()['tag'] as List<String>;
    title = document.data()['title'] as String;
    // StringをDateTimeに変換するための.toDate()。
    // https://stackoverflow.com/questions/52996707/flutter-app-error-type-timestamp-is-not-a-subtype-of-type-datetime
    updateAt = document.data()['updateAt'].toDate() as DateTime;
    description= document.data()['description'] as String;
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tag': tag,
      'title': title,
      'updateAt': updateAt,
      'description': description,
    };
  }

  String id;
  List<String> tag;
  String title;
  DateTime updateAt;
  String description;
}
