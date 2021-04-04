// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'note_writing_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoteWritingPageStateTearOff {
  const _$NoteWritingPageStateTearOff();

_NoteWritingPageState call({ List<Note> notes = const <Note>[],  bool isChanged = false,  String title = '',  String description = ''}) {
  return  _NoteWritingPageState(notes:notes,isChanged:isChanged,title:title,description:description,);
}

}

/// @nodoc
const $NoteWritingPageState = _$NoteWritingPageStateTearOff();

/// @nodoc
mixin _$NoteWritingPageState {

 List<Note> get notes => throw _privateConstructorUsedError; bool get isChanged => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; String get description => throw _privateConstructorUsedError;






@JsonKey(ignore: true)
$NoteWritingPageStateCopyWith<NoteWritingPageState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $NoteWritingPageStateCopyWith<$Res>  {
  factory $NoteWritingPageStateCopyWith(NoteWritingPageState value, $Res Function(NoteWritingPageState) then) = _$NoteWritingPageStateCopyWithImpl<$Res>;
$Res call({
 List<Note> notes, bool isChanged, String title, String description
});



}

/// @nodoc
class _$NoteWritingPageStateCopyWithImpl<$Res> implements $NoteWritingPageStateCopyWith<$Res> {
  _$NoteWritingPageStateCopyWithImpl(this._value, this._then);

  final NoteWritingPageState _value;
  // ignore: unused_field
  final $Res Function(NoteWritingPageState) _then;

@override $Res call({Object notes = freezed,Object isChanged = freezed,Object title = freezed,Object description = freezed,}) {
  return _then(_value.copyWith(
notes: notes == freezed ? _value.notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,isChanged: isChanged == freezed ? _value.isChanged : isChanged // ignore: cast_nullable_to_non_nullable
as bool,title: title == freezed ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,description: description == freezed ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
abstract class _$NoteWritingPageStateCopyWith<$Res> implements $NoteWritingPageStateCopyWith<$Res> {
  factory _$NoteWritingPageStateCopyWith(_NoteWritingPageState value, $Res Function(_NoteWritingPageState) then) = __$NoteWritingPageStateCopyWithImpl<$Res>;
@override $Res call({
 List<Note> notes, bool isChanged, String title, String description
});



}

/// @nodoc
class __$NoteWritingPageStateCopyWithImpl<$Res> extends _$NoteWritingPageStateCopyWithImpl<$Res> implements _$NoteWritingPageStateCopyWith<$Res> {
  __$NoteWritingPageStateCopyWithImpl(_NoteWritingPageState _value, $Res Function(_NoteWritingPageState) _then)
      : super(_value, (v) => _then(v as _NoteWritingPageState));

@override
_NoteWritingPageState get _value => super._value as _NoteWritingPageState;

@override $Res call({Object notes = freezed,Object isChanged = freezed,Object title = freezed,Object description = freezed,}) {
  return _then(_NoteWritingPageState(
notes: notes == freezed ? _value.notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,isChanged: isChanged == freezed ? _value.isChanged : isChanged // ignore: cast_nullable_to_non_nullable
as bool,title: title == freezed ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,description: description == freezed ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}



/// @nodoc
class _$_NoteWritingPageState  implements _NoteWritingPageState {
   _$_NoteWritingPageState({this.notes = const <Note>[], this.isChanged = false, this.title = '', this.description = ''});

  

@JsonKey(defaultValue: const <Note>[]) @override  final List<Note> notes;@JsonKey(defaultValue: false) @override  final bool isChanged;@JsonKey(defaultValue: '') @override  final String title;@JsonKey(defaultValue: '') @override  final String description;

@override
String toString() {
  return 'NoteWritingPageState(notes: $notes, isChanged: $isChanged, title: $title, description: $description)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other is _NoteWritingPageState&&(identical(other.notes, notes) || const DeepCollectionEquality().equals(other.notes, notes))&&(identical(other.isChanged, isChanged) || const DeepCollectionEquality().equals(other.isChanged, isChanged))&&(identical(other.title, title) || const DeepCollectionEquality().equals(other.title, title))&&(identical(other.description, description) || const DeepCollectionEquality().equals(other.description, description)));
}

@override
int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(notes)^ const DeepCollectionEquality().hash(isChanged)^ const DeepCollectionEquality().hash(title)^ const DeepCollectionEquality().hash(description);

@JsonKey(ignore: true)
@override
_$NoteWritingPageStateCopyWith<_NoteWritingPageState> get copyWith => __$NoteWritingPageStateCopyWithImpl<_NoteWritingPageState>(this, _$identity);






}


abstract class _NoteWritingPageState implements NoteWritingPageState {
   factory _NoteWritingPageState({ List<Note> notes,  bool isChanged,  String title,  String description}) = _$_NoteWritingPageState;
  

  

@override  List<Note> get notes => throw _privateConstructorUsedError;@override  bool get isChanged => throw _privateConstructorUsedError;@override  String get title => throw _privateConstructorUsedError;@override  String get description => throw _privateConstructorUsedError;
@override @JsonKey(ignore: true)
_$NoteWritingPageStateCopyWith<_NoteWritingPageState> get copyWith => throw _privateConstructorUsedError;

}
