import 'package:flutter/material.dart';

class SigningTextField extends StatelessWidget {
  const SigningTextField(
      {@required this.onChanged,@required this.fieldName,@required this.textInputType, this.obscureText=false});

  final Function(String) onChanged;
  final String fieldName;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyle(
              color: theme.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        TextField(
          onChanged: onChanged,
          keyboardType: textInputType,
          obscureText: obscureText,
          style: TextStyle(color: Colors.grey[600]),
          decoration: const InputDecoration(counterText: ''),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SigningElevatedButton extends StatelessWidget {
  const SigningElevatedButton(
      {@required this.childText,
      @required this.onPressed,
      @required this.isChanged});

  final bool isChanged;
  final String childText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(0, 17, 0, 17)),
              backgroundColor: isChanged
                  ? MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor)
                  : MaterialStateProperty.all<Color>(Colors.grey),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  const StadiumBorder())),
          child: Text(
            childText,
            style: const TextStyle(fontSize: 18),
          )),
    );
  }
}
