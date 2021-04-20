import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:yournoteapp/common/index.dart';
import 'package:yournoteapp/domain/index.dart';
import 'package:yournoteapp/repository/index.dart';

part 'database_use_case.freezed.dart';

@freezed
class DatabaseUseCaseState with _$DatabaseUseCaseState {
  factory DatabaseUseCaseState() = _DatabaseUseCaseState;
}

class DatabaseUseCaseNotifier extends StateNotifier<DatabaseUseCaseState>
    with LocatorMixin {
  DatabaseUseCaseNotifier() : super(DatabaseUseCaseState());

  DatabaseRepository get _database => read<DatabaseRepository>();

  Future<void> addUser(String uid, String userName, String email) async {
    await _database.addUser(uid, User(
      uid: uid,
      name: userName,
      email: email,
      createAt: DateTime.now()
    ));
    print('add user profile to Firestore');
  }

  Future<void> setNote(BuildContext context, String uid, String title, String description) async {
    try {
      await _database.setNote(
          uid,
          Note(
              title: title,
              description: description,
              updateAt: DateTime.now()));
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      await showCommonDialog<void>(context, noteSaveErrorTitle, e.toString());
      print(e);
    } on Exception catch (e) {
      await showCommonDialog<void>(context, title, e.toString());
      print(e);
    }
  }
}
