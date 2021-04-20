import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../auth_repository.dart';

class AuthDataSource implements AuthRepository {
  AuthDataSource({
    FirebaseAuth auth,
  }) {
    _auth = auth != null ? auth : FirebaseAuth.instance;
  }

  FirebaseAuth _auth;

  // currentUser
  @override
  User currentUser = FirebaseAuth.instance.currentUser;

  // アカウントの作成
  @override
  Future<String> createUserWithEmailAndPassword(
      {@required String email, @required String password}) async {
      return _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((UserCredential credential) => credential.user.uid);

  }

  // サインイン
  @override
  Future<void> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
  }

  // サインアウト
  @override
  Future<void> signOut() async {
    await _auth.signOut();
    print('completely signed out');
  }

  // パスワード再設定
  @override
  Future<void> sendPasswordSetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);

  }
}
