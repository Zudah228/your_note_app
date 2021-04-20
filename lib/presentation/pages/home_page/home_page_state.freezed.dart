// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomePageStateTearOff {
  const _$HomePageStateTearOff();

_HomePageState call({ User user = null,  List<Note> notes = const <Note>[]}) {
  return  _HomePageState(user:user,notes:notes,);
}

}

/// @nodoc
const $HomePageState = _$HomePageStateTearOff();

/// @nodoc
mixin _$HomePageState {

 User get user => throw _privateConstructorUsedError; List<Note> get notes => throw _privateConstructorUsedError;






@JsonKey(ignore: true)
$HomePageStateCopyWith<HomePageState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res>  {
  factory $HomePageStateCopyWith(HomePageState value, $Res Function(HomePageState) then) = _$HomePageStateCopyWithImpl<$Res>;
$Res call({
 User user, List<Note> notes
});



}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res> implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;

@override $Res call({Object user = freezed,Object notes = freezed,}) {
  return _then(_value.copyWith(
user: user == freezed ? _value.user : user // ignore: cast_nullable_to_non_nullable
as User,notes: notes == freezed ? _value.notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,
  ));
}

}


/// @nodoc
abstract class _$HomePageStateCopyWith<$Res> implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(_HomePageState value, $Res Function(_HomePageState) then) = __$HomePageStateCopyWithImpl<$Res>;
@override $Res call({
 User user, List<Note> notes
});



}

/// @nodoc
class __$HomePageStateCopyWithImpl<$Res> extends _$HomePageStateCopyWithImpl<$Res> implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(_HomePageState _value, $Res Function(_HomePageState) _then)
      : super(_value, (v) => _then(v as _HomePageState));

@override
_HomePageState get _value => super._value as _HomePageState;

@override $Res call({Object user = freezed,Object notes = freezed,}) {
  return _then(_HomePageState(
user: user == freezed ? _value.user : user // ignore: cast_nullable_to_non_nullable
as User,notes: notes == freezed ? _value.notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,
  ));
}


}



/// @nodoc
class _$_HomePageState  implements _HomePageState {
   _$_HomePageState({this.user = null, this.notes = const <Note>[]});

  

@JsonKey(defaultValue: null) @override  final User user;@JsonKey(defaultValue: const <Note>[]) @override  final List<Note> notes;

@override
String toString() {
  return 'HomePageState(user: $user, notes: $notes)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other is _HomePageState&&(identical(other.user, user) || const DeepCollectionEquality().equals(other.user, user))&&(identical(other.notes, notes) || const DeepCollectionEquality().equals(other.notes, notes)));
}

@override
int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(user)^ const DeepCollectionEquality().hash(notes);

@JsonKey(ignore: true)
@override
_$HomePageStateCopyWith<_HomePageState> get copyWith => __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);






}


abstract class _HomePageState implements HomePageState {
   factory _HomePageState({ User user,  List<Note> notes}) = _$_HomePageState;
  

  

@override  User get user => throw _privateConstructorUsedError;@override  List<Note> get notes => throw _privateConstructorUsedError;
@override @JsonKey(ignore: true)
_$HomePageStateCopyWith<_HomePageState> get copyWith => throw _privateConstructorUsedError;

}
