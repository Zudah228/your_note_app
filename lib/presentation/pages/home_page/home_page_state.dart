import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:yournoteapp/domain/index.dart';
import 'package:yournoteapp/repository/index.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(null) User user,
    @Default(<Note>[]) List<Note> notes,
  }) = _HomePageState;
}

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier(
      {@required this.authRepository, @required this.databaseRepository})
      : super(HomePageState()) {
    databaseRepository.currentUserData.listen((DocumentSnapshot snapshot) {
      state = state.copyWith(
          user: User.fromDocument(snapshot));
    });
    databaseRepository.notesStream.listen((QuerySnapshot snapshot) {
      state = state.copyWith(
          notes: snapshot.docs.map((doc) => Note.fromDocument(doc)).toList());
    });
  }

  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
}
