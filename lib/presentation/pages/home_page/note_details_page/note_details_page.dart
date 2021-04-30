import 'package:flutter/material.dart';

import '../../index.dart';

class NoteDetailsPage extends StatelessWidget {
  const NoteDetailsPage(
      {@required this.title, @required this.content, @required this.id})
      : super();
  final String title;
  final String content;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              // TODO(me): AppRouteの活用と引数
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (context) => NoteWritingPage.wrapped()));
            },
            child: const Text('編集'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(5)))),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor)
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [Text(title), Text(content)],
        ),
      ),
    );
  }
}
