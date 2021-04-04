// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'create_account_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreateAccountPageStateTearOff {
  const _$CreateAccountPageStateTearOff();

_CreateAccountPageState call({ String email = '',  String password = ''}) {
  return  _CreateAccountPageState(email:email,password:password,);
}

}

/// @nodoc
const $CreateAccountPageState = _$CreateAccountPageStateTearOff();

/// @nodoc
mixin _$CreateAccountPageState {

 String get email => throw _privateConstructorUsedError; String get password => throw _privateConstructorUsedError;






@JsonKey(ignore: true)
$CreateAccountPageStateCopyWith<CreateAccountPageState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $CreateAccountPageStateCopyWith<$Res>  {
  factory $CreateAccountPageStateCopyWith(CreateAccountPageState value, $Res Function(CreateAccountPageState) then) = _$CreateAccountPageStateCopyWithImpl<$Res>;
$Res call({
 String email, String password
});



}

/// @nodoc
class _$CreateAccountPageStateCopyWithImpl<$Res> implements $CreateAccountPageStateCopyWith<$Res> {
  _$CreateAccountPageStateCopyWithImpl(this._value, this._then);

  final CreateAccountPageState _value;
  // ignore: unused_field
  final $Res Function(CreateAccountPageState) _then;

@override $Res call({Object email = freezed,Object password = freezed,}) {
  return _then(_value.copyWith(
email: email == freezed ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,password: password == freezed ? _value.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
abstract class _$CreateAccountPageStateCopyWith<$Res> implements $CreateAccountPageStateCopyWith<$Res> {
  factory _$CreateAccountPageStateCopyWith(_CreateAccountPageState value, $Res Function(_CreateAccountPageState) then) = __$CreateAccountPageStateCopyWithImpl<$Res>;
@override $Res call({
 String email, String password
});



}

/// @nodoc
class __$CreateAccountPageStateCopyWithImpl<$Res> extends _$CreateAccountPageStateCopyWithImpl<$Res> implements _$CreateAccountPageStateCopyWith<$Res> {
  __$CreateAccountPageStateCopyWithImpl(_CreateAccountPageState _value, $Res Function(_CreateAccountPageState) _then)
      : super(_value, (v) => _then(v as _CreateAccountPageState));

@override
_CreateAccountPageState get _value => super._value as _CreateAccountPageState;

@override $Res call({Object email = freezed,Object password = freezed,}) {
  return _then(_CreateAccountPageState(
email: email == freezed ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,password: password == freezed ? _value.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}



/// @nodoc
class _$_CreateAccountPageState  implements _CreateAccountPageState {
   _$_CreateAccountPageState({this.email = '', this.password = ''});

  

@JsonKey(defaultValue: '') @override  final String email;@JsonKey(defaultValue: '') @override  final String password;

@override
String toString() {
  return 'CreateAccountPageState(email: $email, password: $password)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other is _CreateAccountPageState&&(identical(other.email, email) || const DeepCollectionEquality().equals(other.email, email))&&(identical(other.password, password) || const DeepCollectionEquality().equals(other.password, password)));
}

@override
int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(email)^ const DeepCollectionEquality().hash(password);

@JsonKey(ignore: true)
@override
_$CreateAccountPageStateCopyWith<_CreateAccountPageState> get copyWith => __$CreateAccountPageStateCopyWithImpl<_CreateAccountPageState>(this, _$identity);






}


abstract class _CreateAccountPageState implements CreateAccountPageState {
   factory _CreateAccountPageState({ String email,  String password}) = _$_CreateAccountPageState;
  

  

@override  String get email => throw _privateConstructorUsedError;@override  String get password => throw _privateConstructorUsedError;
@override @JsonKey(ignore: true)
_$CreateAccountPageStateCopyWith<_CreateAccountPageState> get copyWith => throw _privateConstructorUsedError;

}
