import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:yournoteapp/common/index.dart';
import 'package:yournoteapp/main.dart';
import 'package:yournoteapp/repository/auth_repository.dart';

import '../../app_routes.dart';

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
      await showCommonDialog<void>(context, errorMessageToText(e.toString()),
          errorMessageToText(e.toString()));
    } on Exception catch (e) {
      print(e);
      await showCommonDialog<void>(context, errorMessageToText(e.toString()),
          errorMessageToText(e.toString()));
    }
  }

  Future<String> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      final uid = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('completely created');
      return uid;
    } on FirebaseAuthException catch (e) {
      print(e);
      await showCommonDialog<void>(
          context, '送信に失敗', errorMessageToText(e.toString()));
      return null;
    } on Exception catch (e) {
      print(e);
      await showCommonDialog<void>(
          context, '送信に失敗', errorMessageToText(e.toString()));
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut().then((value) async {
      // FIXME: サインアウトしても、currentUserの値が更新されない
      runApp(MaterialApp(home: YourNoteApp()));
      await Navigator.of(context).pushNamed(AppRoutes.signIn);
    });
  }
}
