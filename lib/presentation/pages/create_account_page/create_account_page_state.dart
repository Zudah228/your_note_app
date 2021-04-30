import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'create_account_page_state.freezed.dart';

@freezed
class CreateAccountPageState with _$CreateAccountPageState {
  factory CreateAccountPageState({
    @Default('')String email,
    @Default('')String password,
  }) = _CreateAccountPageState;
}

class CreateAccountPageNotifier extends StateNotifier<CreateAccountPageState> {
  CreateAccountPageNotifier() : super(CreateAccountPageState());

  void emailOnChanged(String email) {
    state = state.copyWith(email: email,);
  }
  void passwordOnChanged(String password) {
    state = state.copyWith(password: password);
  }
}