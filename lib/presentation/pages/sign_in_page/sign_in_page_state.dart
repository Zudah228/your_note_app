import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'sign_in_page_state.freezed.dart';

@freezed
class SignInPageState with _$SignInPageState {
  factory SignInPageState({
    @Default('')String email,
    @Default('')String password,
  }) = _SignInPageState;
}

class SignInPageNotifier extends StateNotifier<SignInPageState> {
  SignInPageNotifier() : super(SignInPageState());

  void emailOnChanged(String email) {
    state = state.copyWith(email: email,);
  }
  void passwordOnChanged(String password) {
    state = state.copyWith(password: password);
  }
}