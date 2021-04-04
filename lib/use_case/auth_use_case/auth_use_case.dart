import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:yournoteapp/repository/auth_repository.dart';

part 'auth_use_case.freezed.dart';

@freezed
class AuthUseCaseState with _$AuthUseCaseState {
  factory AuthUseCaseState({@Default(null) User currentUser}) =
      _AuthUseCaseState;
}

class AuthUseCaseNotifier extends StateNotifier<AuthUseCaseState>
    with LocatorMixin {
  AuthUseCaseNotifier() : super(AuthUseCaseState());

  AuthRepository get _auth => read<AuthRepository>();

  Future<void> signInWithEmailAndPassword(String email, String password,
      BuildContext context, String navigatingRouteName) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print('completely signed in');
      await Navigator.pushNamed(context, navigatingRouteName);
    } on FirebaseAuthException catch (e) {
      print(e);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password,
      BuildContext context, String navigatingRouteName) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('completely created');
      await Navigator.pushNamed(context, navigatingRouteName);
    } on FirebaseAuthException catch (e) {
      print(e);
    } on Exception catch (e) {
      print(e);
    }
  }
}
