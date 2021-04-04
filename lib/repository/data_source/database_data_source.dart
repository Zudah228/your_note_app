import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yournoteapp/domain/index.dart';

import '../database_repository.dart';

class DatabaseDataSource implements DatabaseRepository {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Stream<DocumentSnapshot> get currentUserData => _fireStore
      .collection('users')
      .doc(fb_auth.FirebaseAuth.instance.currentUser.uid)
      .snapshots();

  @override
  Stream<QuerySnapshot> get notesStream =>
      _fireStore.collection('notes').snapshots();

  @override
  Future<bool> hasSignedIn(String uid) async {
    final userList = await _fireStore.collection('users').get().then((value) =>
        value.docs.map((doc) => User.fromDocument(doc).uid).toList());
    print('successfully get uid List from Firestore');
    return userList.contains(uid);
  }

  @override
  Future<void> addUser(String uid, User user) async {
    await _fireStore.collection('users').doc(uid).set(user.toMap());
  }

  @override
  Future<void> updateUser(Map<String, dynamic> map, String uid) {
    return _fireStore.collection('users').doc(uid).update(map);
  }

  // Noteの追加
  @override
  Future<void> setNote(String uid, Note note) async {
    if (note.id == null) {
      await _fireStore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .add(note.toMap());
      print('add document to Firestore');
    } else {
      await _fireStore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(note.id)
          .set(note.toMap());
      print('update document in Firestore');
    }
  }

  @override
  Future<void> deleteData(String collectionName, String id) async {
    await _fireStore.collection(collectionName).doc(id).delete();
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    if (file == null) {
      return '';
    }
    final ref = FirebaseStorage.instance.ref(path);
    final uploadTask = await ref.putFile(file);
    final downloadURL = await uploadTask.ref.getDownloadURL();
    return downloadURL;
  }
}
