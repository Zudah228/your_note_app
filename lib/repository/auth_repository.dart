import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  User currentUser;

  Future<void> createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<void> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  });
}
