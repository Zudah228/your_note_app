import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/repository/index.dart';

import 'presentation/pages/index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      if (context
          .read<AuthRepository>()
          .currentUser == null) {
        return SignInPage.wrapped();
      } else {
        return HomePage.wrapped();
      }
    }

}
