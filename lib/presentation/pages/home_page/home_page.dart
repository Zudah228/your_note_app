import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';

import 'home_page_state.dart';

class HomePage extends StatelessWidget {
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<HomePageNotifier, HomePageState>(
          create: (_) => HomePageNotifier(),
        )
      ],
      child: HomePage(),
    );
  }
  // TODO(me): storageとfirestoreから、ユーザー関係ない共通の画像とかを表示する。
  // TODO(me): セキュリティルールを利用してノートのリストを表示

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Note'),
        leading: Container(),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.noteWriting),
        child: const Icon(Icons.note_add),
      ),
    );
  }
}