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
  // TODO(me): エラーコードのをUIに昇華
  @override
  Future<void> createUserWithEmailAndPassword(
      {@required String email, @required String password}) async {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
  }

  // サインイン
  // TODO(me): エラーコードのをUIに昇華
  @override
  Future<void> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
  }
}
