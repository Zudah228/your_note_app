// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_in_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInPageStateTearOff {
  const _$SignInPageStateTearOff();

_SignInPageState call({ String email = '',  String password = '',  String iconURL = '',  bool obscurePasswordText = true}) {
  return  _SignInPageState(email:email,password:password,iconURL:iconURL,obscurePasswordText:obscurePasswordText,);
}

}

/// @nodoc
const $SignInPageState = _$SignInPageStateTearOff();

/// @nodoc
mixin _$SignInPageState {

 String get email => throw _privateConstructorUsedError; String get password => throw _privateConstructorUsedError; String get iconURL => throw _privateConstructorUsedError; bool get obscurePasswordText => throw _privateConstructorUsedError;






@JsonKey(ignore: true)
$SignInPageStateCopyWith<SignInPageState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $SignInPageStateCopyWith<$Res>  {
  factory $SignInPageStateCopyWith(SignInPageState value, $Res Function(SignInPageState) then) = _$SignInPageStateCopyWithImpl<$Res>;
$Res call({
 String email, String password, String iconURL, bool obscurePasswordText
});



}

/// @nodoc
class _$SignInPageStateCopyWithImpl<$Res> implements $SignInPageStateCopyWith<$Res> {
  _$SignInPageStateCopyWithImpl(this._value, this._then);

  final SignInPageState _value;
  // ignore: unused_field
  final $Res Function(SignInPageState) _then;

@override $Res call({Object email = freezed,Object password = freezed,Object iconURL = freezed,Object obscurePasswordText = freezed,}) {
  return _then(_value.copyWith(
email: email == freezed ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,password: password == freezed ? _value.password : password // ignore: cast_nullable_to_non_nullable
as String,iconURL: iconURL == freezed ? _value.iconURL : iconURL // ignore: cast_nullable_to_non_nullable
as String,obscurePasswordText: obscurePasswordText == freezed ? _value.obscurePasswordText : obscurePasswordText // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
abstract class _$SignInPageStateCopyWith<$Res> implements $SignInPageStateCopyWith<$Res> {
  factory _$SignInPageStateCopyWith(_SignInPageState value, $Res Function(_SignInPageState) then) = __$SignInPageStateCopyWithImpl<$Res>;
@override $Res call({
 String email, String password, String iconURL, bool obscurePasswordText
});



}

/// @nodoc
class __$SignInPageStateCopyWithImpl<$Res> extends _$SignInPageStateCopyWithImpl<$Res> implements _$SignInPageStateCopyWith<$Res> {
  __$SignInPageStateCopyWithImpl(_SignInPageState _value, $Res Function(_SignInPageState) _then)
      : super(_value, (v) => _then(v as _SignInPageState));

@override
_SignInPageState get _value => super._value as _SignInPageState;

@override $Res call({Object email = freezed,Object password = freezed,Object iconURL = freezed,Object obscurePasswordText = freezed,}) {
  return _then(_SignInPageState(
email: email == freezed ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,password: password == freezed ? _value.password : password // ignore: cast_nullable_to_non_nullable
as String,iconURL: iconURL == freezed ? _value.iconURL : iconURL // ignore: cast_nullable_to_non_nullable
as String,obscurePasswordText: obscurePasswordText == freezed ? _value.obscurePasswordText : obscurePasswordText // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}



/// @nodoc
class _$_SignInPageState  implements _SignInPageState {
   _$_SignInPageState({this.email = '', this.password = '', this.iconURL = '', this.obscurePasswordText = true});

  

@JsonKey(defaultValue: '') @override  final String email;@JsonKey(defaultValue: '') @override  final String password;@JsonKey(defaultValue: '') @override  final String iconURL;@JsonKey(defaultValue: true) @override  final bool obscurePasswordText;

@override
String toString() {
  return 'SignInPageState(email: $email, password: $password, iconURL: $iconURL, obscurePasswordText: $obscurePasswordText)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other is _SignInPageState&&(identical(other.email, email) || const DeepCollectionEquality().equals(other.email, email))&&(identical(other.password, password) || const DeepCollectionEquality().equals(other.password, password))&&(identical(other.iconURL, iconURL) || const DeepCollectionEquality().equals(other.iconURL, iconURL))&&(identical(other.obscurePasswordText, obscurePasswordText) || const DeepCollectionEquality().equals(other.obscurePasswordText, obscurePasswordText)));
}

@override
int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(email)^ const DeepCollectionEquality().hash(password)^ const DeepCollectionEquality().hash(iconURL)^ const DeepCollectionEquality().hash(obscurePasswordText);

@JsonKey(ignore: true)
@override
_$SignInPageStateCopyWith<_SignInPageState> get copyWith => __$SignInPageStateCopyWithImpl<_SignInPageState>(this, _$identity);






}


abstract class _SignInPageState implements SignInPageState {
   factory _SignInPageState({ String email,  String password,  String iconURL,  bool obscurePasswordText}) = _$_SignInPageState;
  

  

@override  String get email => throw _privateConstructorUsedError;@override  String get password => throw _privateConstructorUsedError;@override  String get iconURL => throw _privateConstructorUsedError;@override  bool get obscurePasswordText => throw _privateConstructorUsedError;
@override @JsonKey(ignore: true)
_$SignInPageStateCopyWith<_SignInPageState> get copyWith => throw _privateConstructorUsedError;

}
