import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/presentation/common_widget/index.dart';
import 'package:yournoteapp/presentation/pages/sign_in_page/send_password_set_email_page_state.dart';
import 'package:yournoteapp/use_case/auth_use_case/auth_use_case.dart';

class SendPasswordSetEmailPage extends StatelessWidget {
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SendPasswordSetEmailPageNotifier,
            SendPasswordSetEmailPageState>(
          create: (_) => SendPasswordSetEmailPageNotifier(),
        )
      ],
      child: SendPasswordSetEmailPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // StateNotifier
    final _onChanged =
        context.watch<SendPasswordSetEmailPageNotifier>().emailOnChanged;
    final _email = context
        .select<SendPasswordSetEmailPageState, String>((state) => state.email);
    //UseCase
    final _sendPasswordSetEmail = context
        .watch<AuthUseCaseNotifier>()
        .sendPasswordSetEmail(context, _email);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'パスワード再設定',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            SigningPageTextField(onChanged: _onChanged, fieldName: 'メールアドレス'),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => _sendPasswordSetEmail,
                  style: WidgetStyle.kButtonStyle(context),
                  child: const Text(
                    'メールを送信する',
                    style: WidgetStyle.kSigningPageButtonTextStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
