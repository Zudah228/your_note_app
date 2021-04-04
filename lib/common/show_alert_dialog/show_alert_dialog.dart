import 'package:flutter/material.dart';
import 'package:yournoteapp/presentation/common_widget/alert_dialog/alert_dialog.dart';

Future<T> showAlertDialog<T>(
    BuildContext context, String title, String content) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialogWidget(title: title,content: content)
  );
}

const String writingCancelTitle = '本当によろしいですか？';
const String writingCancelContent = '編集した内容が消去されます。';