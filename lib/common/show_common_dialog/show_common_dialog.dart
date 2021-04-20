import 'package:flutter/material.dart';
import 'package:yournoteapp/presentation/common_widget/index.dart';

Future<T> showCommonDialog<T>(
    BuildContext context, String title, String content) {
  return showDialog(
      context: context,
      builder: (_) => CommonDialog(title: title,content: content,)
  );
}
const String signInErrorTitle = 'サインインに失敗';
const String noteSaveErrorTitle = '保存に失敗しました';
const String networkErrorContent = '通信エラーが発生しました。ネット環境をお確かめの上、もう一度お試しください。';

const String sendSetEmailTitle = 'メールが送られました！';
const String sendSetEmailContent = '届いたメールから、パスワード再設定を行ってください。';