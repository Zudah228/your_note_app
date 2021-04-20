import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';
import 'package:yournoteapp/presentation/common_widget/index.dart';
import 'package:yournoteapp/presentation/pages/sign_in_page/sign_in_page_state.dart';
import 'package:yournoteapp/repository/database_repository.dart';
import 'package:yournoteapp/use_case/auth_use_case/auth_use_case.dart';

class SignInPage extends StatelessWidget {
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SignInPageNotifier, SignInPageState>(
          create: (context) =>
              SignInPageNotifier(context.read<DatabaseRepository>()),
        )
      ],
      child: SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _viewModel = _ViewModel.fromStateNotifier(context);
    final _auth = context.watch<AuthUseCaseNotifier>();
    final theme = Theme.of(context);
    // キーボードが表示されると上にスクロールされるように
    final _bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, _bottomSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Image.asset(
                      'assets/images/app_icon.png',
                      height: 150,
                      width: 150,
                    ),
                  )),
              const SizedBox(height: 30),
              Text(
                'ようこそ！',
                style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 50),
              SigningPageTextField(
                onChanged: _viewModel.emailOnChanged,
                textInputType: TextInputType.emailAddress,
                fieldName: 'メールアドレス',
              ),
              SigningPageTextField(
                onChanged: _viewModel.passwordOnChanged,
                obscureText: _viewModel.obscurePasswordText,
                fieldName: 'パスワード',
                displayPasswordHelpButton: true,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      await _auth.signInWithEmailAndPassword(_viewModel.email,
                          _viewModel.password, context, AppRoutes.home);
                    },
                    style: WidgetStyle.kButtonStyle(context),
                    child: const Text(
                      'サインイン',
                      style: WidgetStyle.kSigningPageButtonTextStyle,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(
                      text: 'アカウントを持っていない方はこちら',
                      style: TextStyle(color: theme.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(
                            context, AppRoutes.createAccount))),
              const SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  _ViewModel(this.emailOnChanged, this.passwordOnChanged, this.email,
      this.password, this.obscurePasswordText);

  _ViewModel.fromStateNotifier(BuildContext context)
      : email = context.select<SignInPageState, String>((state) => state.email),
        password =
            context.select<SignInPageState, String>((state) => state.password),
        obscurePasswordText = context.select<SignInPageState, bool>(
            (state) => state.obscurePasswordText),
        emailOnChanged = context.watch<SignInPageNotifier>().emailOnChanged,
        passwordOnChanged =
            context.watch<SignInPageNotifier>().passwordOnChanged;

  final String email;
  final String password;
  final bool obscurePasswordText;
  final void Function(String) emailOnChanged;
  final void Function(String) passwordOnChanged;
}
