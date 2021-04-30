import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note_editing_page_state.dart';

class NoteEditing extends StatelessWidget {
  const NoteEditing(
      {Key key,
      this.isChanged,
      this.pageTitle,
      this.buttonText,
      this.onPressedTextButton,
      this.appBarLeading})
      : super(key: key);
  final bool isChanged;
  final String pageTitle;
  final String buttonText;
  final Future<void> onPressedTextButton;
  final Widget appBarLeading;

  @override
  Widget build(BuildContext context) {
    final _viewModel = _ViewModel.fromStateNotifier(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        leading: appBarLeading,
        actions: [
          TextButton(
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
            onPressed: () => onPressedTextButton,
            child: Text(
              buttonText,
              style: TextStyle(color: isChanged ? Colors.white : Colors.blue),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              maxLines: 1,
              style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'タイトルなし'),
              onChanged: _viewModel.titleOnChanged,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(fontSize: 20, height: 1.4),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: '入力してください'),
              onChanged: _viewModel.descriptionOnChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewModel {
  _ViewModel(this.isChanged, this.titleOnChanged, this.descriptionOnChanged,
      this.title, this.description);

  _ViewModel.fromStateNotifier(BuildContext context)
      : isChanged = context
            .select<NoteEditingPageState, bool>((state) => state.isChanged),
        title = context
            .select<NoteEditingPageState, String>((state) => state.title),
        description = context
            .select<NoteEditingPageState, String>((state) => state.description),
        titleOnChanged =
            context.watch<NoteEditingPageNotifier>().titleOnChanged,
        descriptionOnChanged =
            context.watch<NoteEditingPageNotifier>().descriptionOnChanged;

  final bool isChanged;
  final String title;
  final String description;
  final Function(String) titleOnChanged;
  final Function(String) descriptionOnChanged;
}
