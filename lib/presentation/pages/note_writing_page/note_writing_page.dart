import 'package:flutter/material.dart';

class NoteWritingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO(me): タイトル、タグ、内容を入力する場所
    // TODO(me): セキュリティルールを利用して追加
    return Scaffold(
      appBar: AppBar(
        title: const Text('編集'),
        leading: const Text('キャンセル'),
        actions: [GestureDetector(onTap: () {}, child: const Text('保存'))],
      ),
    );
  }
}
