import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key key, this.title, this.content}) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: const Text('いいえ'),
          onPressed: () => Navigator.pop(context, false),
        ),
        TextButton(
          child: const Text('はい'),
          onPressed: () => Navigator.pop(context, true),
        ),],
    );
  }
}
