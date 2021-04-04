import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
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

  Future<void> addUser(String uid, String email, ) async {
    await _database.addUser(uid, User(
      uid: uid,
      email: email,
      createAt: DateTime.now()
    ));
    print('add user profile to Firestore');
  }

  Future<void> setNote(String uid, String title, String description) async {
    try {
      await _database.setNote(
          uid,
          Note(
              title: title,
              description: description,
              updateAt: DateTime.now()));
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
