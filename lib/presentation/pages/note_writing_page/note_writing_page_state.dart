import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:yournoteapp/domain/index.dart';

part 'note_writing_page_state.freezed.dart';

@freezed
class NoteWritingPageState with _$NoteWritingPageState {
  factory NoteWritingPageState(
      {@Default(<Note>[]) List<Note> notes,
      @Default(false) bool isChanged,
      @Default('') String title,
      @Default('') String description}) = _NoteWritingPageState;
}

class NoteWritingPageNotifier extends StateNotifier<NoteWritingPageState> {
  NoteWritingPageNotifier() : super(NoteWritingPageState());

  void titleOnChanged(String value) {
    state = state.copyWith(title: value);
    state = state.copyWith(isChanged: true);
  }

  void descriptionOnChanged(String value) {
    state = state.copyWith(description: value);
    state = state.copyWith(isChanged: true);
  }
}
