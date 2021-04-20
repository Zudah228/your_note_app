import 'package:flutter/material.dart';
import 'package:yournoteapp/presentation/pages/index.dart';
import 'package:yournoteapp/presentation/pages/sign_in_page/send_password_set_email_page.dart';

mixin AppRoutes {
  static final List<String> routeNames = [
    signIn,
    sendPasswordSetEmail,
    createAccount,
    home,
    noteWriting
  ];

  static Widget callWidget(String name) {
    switch (name) {
      case signIn:
        return SignInPage.wrapped();
      case sendPasswordSetEmail:
        return SendPasswordSetEmailPage.wrapped();
      case home:
        return HomePage.wrapped();
      case noteWriting:
        return NoteWritingPage.wrapped();
      case createAccount:
        return CreateAccountPage.wrapped();
      default:
        return null;
    }
  }

  static const String signIn = '/signIn';
  static const String sendPasswordSetEmail = 'sendPasswordSetEmail';
  static const String createAccount = '/createAccount';
  static const String home = '/home';
  static const String noteWriting = 'noteWriting';
}
