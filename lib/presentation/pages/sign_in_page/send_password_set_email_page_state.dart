import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'send_password_set_email_page_state.freezed.dart';

@freezed
class SendPasswordSetEmailPageState with _$SendPasswordSetEmailPageState {
  factory SendPasswordSetEmailPageState({
    @Default('') String email,
  }) = _SendPasswordSetEmailPageState;
}

class SendPasswordSetEmailPageNotifier extends StateNotifier<SendPasswordSetEmailPageState> {
  SendPasswordSetEmailPageNotifier() : super(SendPasswordSetEmailPageState());

  void emailOnChanged(String email) {
    state
    = state.copyWith(email: email);
  }
}