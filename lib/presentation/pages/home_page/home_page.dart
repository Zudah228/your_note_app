import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';
import 'package:yournoteapp/domain/index.dart';
import 'package:yournoteapp/repository/database_repository.dart';
import 'package:yournoteapp/use_case/index.dart';

import 'home_page_state.dart';

class HomePage extends StatelessWidget {
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<HomePageNotifier, HomePageState>(
          create: (context) => HomePageNotifier(
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
    final _database = context.watch<DatabaseUseCaseNotifier>();
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
            await context.read<AuthUseCaseNotifier>().signOut(context);
          },
        ),
        leadingWidth: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _viewModel.notes.length,
                  itemBuilder: (context, index) {
                    final note = _viewModel.notes[index];
                    return _ListTile(note: note);
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
            subtitle: Text(
              note.description.length >= 20
                  ? '${note.description.substring(0, 20)}...'
                  : note.description == ''
                      ? '本文なし'
                      : note.description,
            )),
        const Divider(
          height: 2,
        ),
      ],
    );
  }
}

class _ViewModel {
  _ViewModel(this.notes);

  _ViewModel.fromStateNotifier(BuildContext context)
      : notes =
            context.select<HomePageState, List<Note>>((state) => state.notes);

  final List<Note> notes;
}
