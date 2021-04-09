import 'package:flutter/material.dart';
import 'package:yournoteapp/presentation/common_widget/index.dart';

Future<T> showCommonDialog<T>(
    BuildContext context, String title, String content) {
  return showDialog(
      context: context,
      builder: (_) => CommonDialog(title: title,content: content,)
  );
}

const String noteSaveErrorTitle = '保存に失敗しました';