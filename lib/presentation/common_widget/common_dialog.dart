import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({Key key, this.title, this.content}) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Center(child: Text(title)),
        contentPadding: const EdgeInsets.all(22),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        children: [
          Text(content),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 75,
              child: TextButton(
                child: const Text(
                  '閉じる',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const StadiumBorder())),
              ),
            ),
          ),
        ]);
  }
}
