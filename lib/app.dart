import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/presentation/pages/index.dart';
import 'package:yournoteapp/repository/auth_repository.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthRepository>().currentUser;
    if (currentUser == null) {
      return SignInPage.wrapped();
    }
    {
      return HomePage.wrapped();
    }
  }
}
