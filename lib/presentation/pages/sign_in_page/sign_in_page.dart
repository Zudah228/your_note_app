import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインイン'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(height: 200,width: 200,child: Image.asset('assets/images/app_icon.png',fit: BoxFit.contain,)),
            ),
            _TextField(
              onChanged: _viewModel.emailOnChanged,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              fieldName: 'email',
            ),
            _TextField(
              onChanged: _viewModel.passwordOnChanged,
              obscureText: _viewModel.obscurePasswordText,
              fieldName: 'password',
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  _auth.signInWithEmailAndPassword(_viewModel.email,
                      _viewModel.password, context, AppRoutes.home);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        theme.primaryColor)),
                child: const Text('サインイン')),
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: 'アカウントを持っていない方はこちら',
                    style: TextStyle(color: theme.primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(
                          context, AppRoutes.createAccount)))
          ],
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

class _TextField extends StatelessWidget {
  const _TextField(
      {Key key,
      this.onChanged,
      this.fieldName,
      this.textInputType,
      this.obscureText})
      : super(key: key);

  final Function(String) onChanged;
  final String fieldName;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: onChanged,
          keyboardType: textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(counterText: fieldName),
        ),
      ],
    );
  }
}
