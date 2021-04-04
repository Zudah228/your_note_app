import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:yournoteapp/domain/index.dart';
import 'package:yournoteapp/repository/database_repository.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(<Note>[]) List<Note> notes,
  }) = _HomePageState;
}

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier({@required this.databaseRepository})
      : super(HomePageState()) {
    databaseRepository.notesStream.listen((QuerySnapshot snapshot) {
      state = state.copyWith(notes: snapshot.docs.map((doc) => Note.fromDocument(doc)).toList());
    });
  }

  final DatabaseRepository databaseRepository;
}
