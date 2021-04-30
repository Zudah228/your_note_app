import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/common/show_alert_dialog.dart';
import 'package:yournoteapp/repository/auth_repository.dart';
import 'package:yournoteapp/use_case/database_use_case/database_use_case.dart';

import 'note_writing_page_state.dart';

class NoteWritingPage extends StatelessWidget {
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<NoteWritingPageNotifier, NoteWritingPageState>(
          create: (_) => NoteWritingPageNotifier(),
        )
      ],
      child: NoteWritingPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO(me): タイトル、タグ、内容を入力する場所
    // TODO(me): セキュリティルールを利用して追加
    final _viewModel = _ViewModel.fromStateNotifier(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      onPanDown: (_) => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '編集',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          centerTitle: true,
          leading: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              _CancelButton(isChanged: _viewModel.isChanged)
            ],
          ),
          leadingWidth: 100,
          actions: [
            _SaveButton(
              isChanged: _viewModel.isChanged,
              title: _viewModel.title,
              description: _viewModel.description,
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                maxLines: 1,
                style:
                    const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'タイトルなし'),
                onChanged: _viewModel.titleOnChanged,
              ),
              TextField(
                maxLines: null,
                style: const TextStyle(fontSize: 20, height: 1.4),
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: '入力してください'),
                onChanged: _viewModel.descriptionOnChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton(
      {Key key, this.isChanged, this.title, this.description})
      : super(key: key);

  final bool isChanged;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _uid = context.read<AuthRepository>().currentUser.uid;
    return Center(
        child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: theme.primaryColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5)))),
              backgroundColor: isChanged
                  ? MaterialStateProperty.all<Color>(
                      theme.primaryColor)
                  : MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: isChanged
                ? () async {
                    await context
                        .read<DatabaseUseCaseNotifier>()
                        .setNote(context, _uid, title, description);
                  }
                : null,
            child: Text(
              '保存',
              style: TextStyle(color: isChanged ? Colors.white : Colors.blue),
            )));
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({Key key, this.isChanged}) : super(key: key);
  final bool isChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isChanged
            ? () async {
                final result = await showAlertDialog<bool>(
                    context, writingCancelTitle, writingCancelContent);
                if (result) {
                  Navigator.pop(context);
                }
              }
            : () => Navigator.pop(context),
        child: Text(
          'キャンセル',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ));
  }
}

class _ViewModel {
  _ViewModel(this.isChanged, this.titleOnChanged, this.descriptionOnChanged,
      this.title, this.description);

  _ViewModel.fromStateNotifier(BuildContext context)
      : isChanged = context
            .select<NoteWritingPageState, bool>((state) => state.isChanged),
        title = context
            .select<NoteWritingPageState, String>((state) => state.title),
        description = context
            .select<NoteWritingPageState, String>((state) => state.description),
        titleOnChanged =
            context.watch<NoteWritingPageNotifier>().titleOnChanged,
        descriptionOnChanged =
            context.watch<NoteWritingPageNotifier>().descriptionOnChanged;

  final bool isChanged;
  final String title;
  final String description;
  final Function(String) titleOnChanged;
  final Function(String) descriptionOnChanged;
}
