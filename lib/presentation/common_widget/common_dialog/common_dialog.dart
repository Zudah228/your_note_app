import 'package:flutter/material.dart';

import '../index.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({Key key, this.title, this.content}) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        titlePadding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
        contentPadding: const EdgeInsets.fromLTRB(25,15,25,25),
        children: [
          SizedBox(
              height: 60,
              child: Text(content,
                  style: const TextStyle(fontWeight: FontWeight.w500))),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            child: TextButton(
              child: const Text(
                '閉じる',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              style: WidgetStyle.kButtonStyle(context),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ]);
  }
}
