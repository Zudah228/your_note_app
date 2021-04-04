import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/common/show_alert_dialog/show_alert_dialog.dart';

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
              _CancelButton(
                isChanged: _viewModel.isChanged,
              )
            ],
          ),
          leadingWidth: 100,
          actions: [
            _SavedButton(
              isChanged: _viewModel.isChanged,
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Expanded(
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
          )),
        ),
      ),
    );
  }
}

class _SavedButton extends StatelessWidget {
  const _SavedButton({Key key, this.isChanged}) : super(key: key);
  final bool isChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5)))),
              backgroundColor: isChanged
                  ? MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor)
                  : MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: isChanged ? () {} : null,
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
  _ViewModel(this.isChanged, this.titleOnChanged, this.descriptionOnChanged);

  _ViewModel.fromStateNotifier(BuildContext context)
      : isChanged = context
            .select<NoteWritingPageState, bool>((state) => state.isChanged),
        titleOnChanged =
            context.watch<NoteWritingPageNotifier>().titleOnChanged,
        descriptionOnChanged =
            context.watch<NoteWritingPageNotifier>().descriptionOnChanged;

  final bool isChanged;
  final Function(String) titleOnChanged;
  final Function(String) descriptionOnChanged;
}
