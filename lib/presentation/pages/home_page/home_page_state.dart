import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:yournoteapp/domain/index.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(<Note>[]) List<Note> notes,
  }) = _HomePageState;
}

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier() : super(HomePageState());
}