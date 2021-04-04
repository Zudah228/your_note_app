import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/di_container.dart';

import 'app_routes.dart';
import 'presentation/pages/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(YourNoteApp());
}

class YourNoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = <String, WidgetBuilder>{};
    for (final name in AppRoutes.routeNames) {
      routes[name] = (context) => AppRoutes.callWidget(name);
    }
    return MultiProvider(
      providers: [...repositoryProviders, ...useCaseProviders],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: routes,
        home: SignInPage.wrapped(),
      ),
    );
  }
}
