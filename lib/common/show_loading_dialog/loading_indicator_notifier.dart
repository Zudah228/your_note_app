import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yournoteapp/common/modal_overlay/modal_overlay.dart';
import 'package:state_notifier/state_notifier.dart';

import 'loading_indicator_state.dart';

class LoadingIndicatorNotifier extends StateNotifier<LoadingIndicatorState> {
  LoadingIndicatorNotifier() : super(const LoadingIndicatorState());
  void showLoading(BuildContext context) {
    state = state.copyWith(isLoading: true);
    Navigator.push(
      context,
      ModalOverlay(
        const Center(
          child: CircularProgressIndicator(),
        ),
        isAndroidBackEnable: false,
      ),
    );
  }

  void hideLoading(BuildContext context) {
    if (state.isLoading) {
      Navigator.of(context).pop();
      state = state.copyWith(isLoading: false);
    } else {
      print('LoadingIndicatorが表示されていません。この状態でhideLoadingを実行しないでください。');
    }
  }
}
