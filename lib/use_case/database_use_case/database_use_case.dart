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

  Future<void> addUser(BuildContext context, String uid, String email) async {
    try {
      await _database.addUser(
          uid, User(uid: uid, email: email, createAt: DateTime.now()));
      print('add user profile to Firestore');
    } on FirebaseException catch (e) {
      print(e);
      await showCommonDialog<void>(
          context, '送信に失敗', errorMessageToText(e.message));
    } on Exception catch (e) {
      print(e);
      await showCommonDialog<void>(
          context, '送信に失敗', errorMessageToText(e.toString()));
    }
  }

  Future<void> deleteNote(BuildContext context, String noteId) async {
    try {
      await _database.deleteData('notes', noteId);
      print('delete note id:$noteId');
    } on FirebaseException catch (e) {
      print(e);
      await showCommonDialog<void>(context, '通信に失敗しました', errorMessageToText(e.code));
    } on Exception catch (e) {
      print(e);
      await showCommonDialog<void>(context, '通信に失敗しました', errorMessageToText(e.toString()));
    }
  }

  Future<void> setNote(BuildContext context, String uid, String title,
      String description) async {
    try {
      await _database.setNote(
          uid,
          Note(
              title: title,
              description: description,
              updateAt: DateTime.now()));
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      print(e);
      await showCommonDialog<void>(
          context, noteSaveErrorTitle, errorMessageToText(e.code));
    } on Exception catch (e) {
      print(e);
      await showCommonDialog<void>(context, title, e.toString());
    }
  }
}
