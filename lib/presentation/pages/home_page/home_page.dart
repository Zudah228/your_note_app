import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';
import 'package:yournoteapp/domain/index.dart';
import 'package:yournoteapp/repository/auth_repository.dart';
import 'package:yournoteapp/repository/database_repository.dart';

import 'home_page_state.dart';

class HomePage extends StatelessWidget {
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<HomePageNotifier, HomePageState>(
          create: (context) => HomePageNotifier(
              authRepository: context.read<AuthRepository>(),
              databaseRepository: context.read<DatabaseRepository>()),
        )
      ],
      child: HomePage(),
    );
  }

  // TODO(me): storageとfirestoreから、ユーザー関係ない共通の画像とかを表示する。
  // TODO(me): セキュリティルールを利用してノートのリストを表示

  @override
  Widget build(BuildContext context) {
    final _viewModel = _ViewModel.fromStateNotifier(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Note'),
        leading: TextButton(
          child: const Text(
            'サインアウト',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            await context.read<AuthRepository>().signOut();
            Navigator.pop(context);
          },
        ),
        leadingWidth: 200,
        actions: [Padding(
          padding: const EdgeInsets.all(18),
          child: Text('${_viewModel.currentUserData.name}さん'),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _viewModel.notes.length,
                  itemBuilder: (context, index) {
                    return _ListTile(note: _viewModel.notes[index]);
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.noteWriting),
        backgroundColor: theme.primaryColor,
        child: const Icon(Icons.note_add),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: Text(note.title == '' ? 'タイトルなし' : note.title),
            subtitle: Text(note.description == '' ? '本文なし' : note.description,
                maxLines: 10)),
        const Divider(
          height: 2,
        ),
      ],
    );
  }
}

class _ViewModel {
  _ViewModel(this.notes, this.currentUserData);

  _ViewModel.fromStateNotifier(BuildContext context)
      : currentUserData = context.select<HomePageState, User>((state) => state.user),
        notes =
            context.select<HomePageState, List<Note>>((state) => state.notes);

  final User currentUserData;
  final List<Note> notes;
}
