import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_indicator_state.freezed.dart';

@freezed
abstract class LoadingIndicatorState with _$LoadingIndicatorState {
  const factory LoadingIndicatorState({
    @Default(false) bool isLoading,
  }) = _LoadingIndicatorState;
}

