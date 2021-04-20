import 'package:flutter/material.dart';

import '../../../app_routes.dart';

class SigningPageTextField extends StatelessWidget {
  const SigningPageTextField(
      {Key key,
      @required this.onChanged,
      @required this.fieldName,
      this.displayPasswordHelpButton = false,
      this.textInputType,
      this.obscureText = false})
      : super(key: key);

  final Function(String) onChanged;
  final String fieldName;
  final bool displayPasswordHelpButton;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fieldName,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600)),
            // パスワード再設定ページをの遷移（サインインページのパスワードの横のみに表示）
            displayPasswordHelpButton
                ? _PasswordHelpButton()
                : const SizedBox()
          ],
        ),
        TextField(
          onChanged: onChanged,
          keyboardType: textInputType,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black45, fontSize: 18),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor))),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

class _PasswordHelpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(
          context, AppRoutes.sendPasswordSetEmail),
      child: Row(
        children: [
          Icon(Icons.help,size: 15,color: _color,),
          const SizedBox(width: 2),
          Text('パスワードを忘れた場合',style: TextStyle(color: _color,fontSize: 13),),
        ],
      ),
    );
  }
}


