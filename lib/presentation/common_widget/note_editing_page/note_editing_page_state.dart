import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:yournoteapp/domain/index.dart';
import 'package:yournoteapp/repository/database_repository.dart';

part 'note_editing_page_state.freezed.dart';

@freezed
class NoteEditingPageState with _$NoteEditingPageState {
  factory NoteEditingPageState(
      {@Default(<Note>[]) List<Note> notes,
        @Default(false) bool isChanged,
        @Default('') String title,
        @Default('') String description}) = _NoteEditingPageState;
}

class NoteWritingPageNotifier extends StateNotifier<NoteEditingPageState>
    with LocatorMixin {
  NoteWritingPageNotifier(this.databaseRepository, this.noteId)
      : super(NoteEditingPageState()) {
    databaseRepository.notesStream.listen((QuerySnapshot snapshot) {
      snapshot.docs.map((doc) {
        state = state.copyWith(
            title: Note.fromDocument(doc).title,
            description: Note.fromDocument(doc).description);
      });
    });
  }

  final DatabaseRepository databaseRepository;
  final String noteId;

  void titleOnChanged(String value) {
    state = state.copyWith(title: value);
    state = state.copyWith(isChanged: true);
  }

  void descriptionOnChanged(String value) {
    state = state.copyWith(description: value);
    state = state.copyWith(isChanged: true);
  }
}
