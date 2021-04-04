// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthUseCaseStateTearOff {
  const _$AuthUseCaseStateTearOff();

_AuthUseCaseState call({ User currentUser = null}) {
  return  _AuthUseCaseState(currentUser:currentUser,);
}

}

/// @nodoc
const $AuthUseCaseState = _$AuthUseCaseStateTearOff();

/// @nodoc
mixin _$AuthUseCaseState {

 User get currentUser => throw _privateConstructorUsedError;






@JsonKey(ignore: true)
$AuthUseCaseStateCopyWith<AuthUseCaseState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AuthUseCaseStateCopyWith<$Res>  {
  factory $AuthUseCaseStateCopyWith(AuthUseCaseState value, $Res Function(AuthUseCaseState) then) = _$AuthUseCaseStateCopyWithImpl<$Res>;
$Res call({
 User currentUser
});



}

/// @nodoc
class _$AuthUseCaseStateCopyWithImpl<$Res> implements $AuthUseCaseStateCopyWith<$Res> {
  _$AuthUseCaseStateCopyWithImpl(this._value, this._then);

  final AuthUseCaseState _value;
  // ignore: unused_field
  final $Res Function(AuthUseCaseState) _then;

@override $Res call({Object currentUser = freezed,}) {
  return _then(_value.copyWith(
currentUser: currentUser == freezed ? _value.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

}


/// @nodoc
abstract class _$AuthUseCaseStateCopyWith<$Res> implements $AuthUseCaseStateCopyWith<$Res> {
  factory _$AuthUseCaseStateCopyWith(_AuthUseCaseState value, $Res Function(_AuthUseCaseState) then) = __$AuthUseCaseStateCopyWithImpl<$Res>;
@override $Res call({
 User currentUser
});



}

/// @nodoc
class __$AuthUseCaseStateCopyWithImpl<$Res> extends _$AuthUseCaseStateCopyWithImpl<$Res> implements _$AuthUseCaseStateCopyWith<$Res> {
  __$AuthUseCaseStateCopyWithImpl(_AuthUseCaseState _value, $Res Function(_AuthUseCaseState) _then)
      : super(_value, (v) => _then(v as _AuthUseCaseState));

@override
_AuthUseCaseState get _value => super._value as _AuthUseCaseState;

@override $Res call({Object currentUser = freezed,}) {
  return _then(_AuthUseCaseState(
currentUser: currentUser == freezed ? _value.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}



/// @nodoc
class _$_AuthUseCaseState  implements _AuthUseCaseState {
   _$_AuthUseCaseState({this.currentUser = null});

  

@JsonKey(defaultValue: User) @override  final User currentUser;

@override
String toString() {
  return 'AuthUseCaseState(currentUser: $currentUser)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other is _AuthUseCaseState&&(identical(other.currentUser, currentUser) || const DeepCollectionEquality().equals(other.currentUser, currentUser)));
}

@override
int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentUser);

@JsonKey(ignore: true)
@override
_$AuthUseCaseStateCopyWith<_AuthUseCaseState> get copyWith => __$AuthUseCaseStateCopyWithImpl<_AuthUseCaseState>(this, _$identity);






}


abstract class _AuthUseCaseState implements AuthUseCaseState {
   factory _AuthUseCaseState({ User currentUser}) = _$_AuthUseCaseState;
  

  

@override  User get currentUser => throw _privateConstructorUsedError;
@override @JsonKey(ignore: true)
_$AuthUseCaseStateCopyWith<_AuthUseCaseState> get copyWith => throw _privateConstructorUsedError;

}
