import 'package:flutter/material.dart';

class WidgetStyle {
  static ButtonStyle kButtonStyle(BuildContext context) {
    return ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )));
  }

  static const kSigningPageButtonTextStyle =
      TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500);
}
