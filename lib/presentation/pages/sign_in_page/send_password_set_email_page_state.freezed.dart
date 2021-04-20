// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'send_password_set_email_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SendPasswordSetEmailPageStateTearOff {
  const _$SendPasswordSetEmailPageStateTearOff();

_SendPasswordSetEmailPageState call({ String email = ''}) {
  return  _SendPasswordSetEmailPageState(email:email,);
}

}

/// @nodoc
const $SendPasswordSetEmailPageState = _$SendPasswordSetEmailPageStateTearOff();

/// @nodoc
mixin _$SendPasswordSetEmailPageState {

 String get email => throw _privateConstructorUsedError;






@JsonKey(ignore: true)
$SendPasswordSetEmailPageStateCopyWith<SendPasswordSetEmailPageState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $SendPasswordSetEmailPageStateCopyWith<$Res>  {
  factory $SendPasswordSetEmailPageStateCopyWith(SendPasswordSetEmailPageState value, $Res Function(SendPasswordSetEmailPageState) then) = _$SendPasswordSetEmailPageStateCopyWithImpl<$Res>;
$Res call({
 String email
});



}

/// @nodoc
class _$SendPasswordSetEmailPageStateCopyWithImpl<$Res> implements $SendPasswordSetEmailPageStateCopyWith<$Res> {
  _$SendPasswordSetEmailPageStateCopyWithImpl(this._value, this._then);

  final SendPasswordSetEmailPageState _value;
  // ignore: unused_field
  final $Res Function(SendPasswordSetEmailPageState) _then;

@override $Res call({Object email = freezed,}) {
  return _then(_value.copyWith(
email: email == freezed ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
abstract class _$SendPasswordSetEmailPageStateCopyWith<$Res> implements $SendPasswordSetEmailPageStateCopyWith<$Res> {
  factory _$SendPasswordSetEmailPageStateCopyWith(_SendPasswordSetEmailPageState value, $Res Function(_SendPasswordSetEmailPageState) then) = __$SendPasswordSetEmailPageStateCopyWithImpl<$Res>;
@override $Res call({
 String email
});



}

/// @nodoc
class __$SendPasswordSetEmailPageStateCopyWithImpl<$Res> extends _$SendPasswordSetEmailPageStateCopyWithImpl<$Res> implements _$SendPasswordSetEmailPageStateCopyWith<$Res> {
  __$SendPasswordSetEmailPageStateCopyWithImpl(_SendPasswordSetEmailPageState _value, $Res Function(_SendPasswordSetEmailPageState) _then)
      : super(_value, (v) => _then(v as _SendPasswordSetEmailPageState));

@override
_SendPasswordSetEmailPageState get _value => super._value as _SendPasswordSetEmailPageState;

@override $Res call({Object email = freezed,}) {
  return _then(_SendPasswordSetEmailPageState(
email: email == freezed ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}



/// @nodoc
class _$_SendPasswordSetEmailPageState  implements _SendPasswordSetEmailPageState {
   _$_SendPasswordSetEmailPageState({this.email = ''});

  

@JsonKey(defaultValue: '') @override  final String email;

@override
String toString() {
  return 'SendPasswordSetEmailPageState(email: $email)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other is _SendPasswordSetEmailPageState&&(identical(other.email, email) || const DeepCollectionEquality().equals(other.email, email)));
}

@override
int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

@JsonKey(ignore: true)
@override
_$SendPasswordSetEmailPageStateCopyWith<_SendPasswordSetEmailPageState> get copyWith => __$SendPasswordSetEmailPageStateCopyWithImpl<_SendPasswordSetEmailPageState>(this, _$identity);






}


abstract class _SendPasswordSetEmailPageState implements SendPasswordSetEmailPageState {
   factory _SendPasswordSetEmailPageState({ String email}) = _$_SendPasswordSetEmailPageState;
  

  

@override  String get email => throw _privateConstructorUsedError;
@override @JsonKey(ignore: true)
_$SendPasswordSetEmailPageStateCopyWith<_SendPasswordSetEmailPageState> get copyWith => throw _privateConstructorUsedError;

}
