// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'loading_indicator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LoadingIndicatorStateTearOff {
  const _$LoadingIndicatorStateTearOff();

// ignore: unused_element
  _LoadingIndicatorState call({bool isLoading = false}) {
    return _LoadingIndicatorState(
      isLoading: isLoading,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LoadingIndicatorState = _$LoadingIndicatorStateTearOff();

/// @nodoc
mixin _$LoadingIndicatorState {
  bool get isLoading;

  $LoadingIndicatorStateCopyWith<LoadingIndicatorState> get copyWith;
}

/// @nodoc
abstract class $LoadingIndicatorStateCopyWith<$Res> {
  factory $LoadingIndicatorStateCopyWith(LoadingIndicatorState value,
          $Res Function(LoadingIndicatorState) then) =
      _$LoadingIndicatorStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class _$LoadingIndicatorStateCopyWithImpl<$Res>
    implements $LoadingIndicatorStateCopyWith<$Res> {
  _$LoadingIndicatorStateCopyWithImpl(this._value, this._then);

  final LoadingIndicatorState _value;
  // ignore: unused_field
  final $Res Function(LoadingIndicatorState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
abstract class _$LoadingIndicatorStateCopyWith<$Res>
    implements $LoadingIndicatorStateCopyWith<$Res> {
  factory _$LoadingIndicatorStateCopyWith(_LoadingIndicatorState value,
          $Res Function(_LoadingIndicatorState) then) =
      __$LoadingIndicatorStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading});
}

/// @nodoc
class __$LoadingIndicatorStateCopyWithImpl<$Res>
    extends _$LoadingIndicatorStateCopyWithImpl<$Res>
    implements _$LoadingIndicatorStateCopyWith<$Res> {
  __$LoadingIndicatorStateCopyWithImpl(_LoadingIndicatorState _value,
      $Res Function(_LoadingIndicatorState) _then)
      : super(_value, (v) => _then(v as _LoadingIndicatorState));

  @override
  _LoadingIndicatorState get _value => super._value as _LoadingIndicatorState;

  @override
  $Res call({
    Object isLoading = freezed,
  }) {
    return _then(_LoadingIndicatorState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
class _$_LoadingIndicatorState implements _LoadingIndicatorState {
  const _$_LoadingIndicatorState({this.isLoading = false})
      : assert(isLoading != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'LoadingIndicatorState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingIndicatorState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isLoading);

  @override
  _$LoadingIndicatorStateCopyWith<_LoadingIndicatorState> get copyWith =>
      __$LoadingIndicatorStateCopyWithImpl<_LoadingIndicatorState>(
          this, _$identity);
}

abstract class _LoadingIndicatorState implements LoadingIndicatorState {
  const factory _LoadingIndicatorState({bool isLoading}) =
      _$_LoadingIndicatorState;

  @override
  bool get isLoading;
  @override
  _$LoadingIndicatorStateCopyWith<_LoadingIndicatorState> get copyWith;
}
