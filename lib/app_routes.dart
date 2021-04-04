import 'package:flutter/material.dart';
import 'package:yournoteapp/presentation/pages/index.dart';

mixin AppRoutes {
  static final List<String> routeNames = [
    signIn,
    createAccount,
    home,
    noteWriting
  ];

  static Widget callWidget(String name) {
    switch (name) {
      case signIn:
        return SignInPage.wrapped();
      case home:
        return HomePage.wrapped();
      case noteWriting:
        return NoteWritingPage();
      case createAccount:
        return CreateAccountPage.wrapped();
      default:
        return null;
    }
  }

  static const String signIn = '/signIn';
  static const String createAccount = '/createAccount';
  static const String home = '/home';
  static const String noteWriting = 'noteWriting';
}
