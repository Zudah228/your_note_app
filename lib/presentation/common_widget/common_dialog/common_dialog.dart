import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {

  const CommonDialog({Key key, this.title, this.content}) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      contentPadding: const EdgeInsets.all(20),
      children: [
        Text(content),
        const SizedBox(height: 10),
        TextButton(
          child: const Text('閉じる'),
          onPressed: () => Navigator.pop(context),
        ),
      ]
    );
  }
}
