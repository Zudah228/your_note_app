import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yournoteapp/domain/note.dart';
import 'package:yournoteapp/domain/user.dart';

abstract class DatabaseRepository {
  Stream<QuerySnapshot> get notesStream;
  Stream<DocumentSnapshot> get currentUserData;
  Future<bool> hasSignedIn(String uid);
  Future<void> setNote( String uid, Note note);
  Future<void> addUser(String uid, User user);
  Future<void> updateUser(Map<String, dynamic> map, String uid);
  Future<void> deleteData(String collectionName, String id);
  Future<String> uploadFile(File file, String path);
}
