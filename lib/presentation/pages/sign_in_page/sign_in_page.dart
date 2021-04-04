import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';
import 'package:yournoteapp/presentation/pages/sign_in_page/sign_in_page_state.dart';
import 'package:yournoteapp/repository/auth_repository.dart';
import 'package:yournoteapp/use_case/auth_use_case/auth_use_case.dart';

class SignInPage extends StatelessWidget {
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SignInPageNotifier, SignInPageState>(
          create: (_) => SignInPageNotifier(),
        )
      ],
      child: SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _viewModel = _ViewModel.fromStateNotifier(context);
    final _auth = context.watch<AuthUseCaseNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインイン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _TextField(
              onChanged: _viewModel.emailOnChanged,
              fieldName: 'email',
            ),
            _TextField(
              onChanged: _viewModel.passwordOnChanged,
              fieldName: 'password',
            ),
            ElevatedButton(
                onPressed: () {
                    _auth.signInWithEmailAndPassword(_viewModel.email,
                        _viewModel.password, context, AppRoutes.home);
                },
                child: const Text('サインイン')),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.createAccount);
                },
                child: const Text('アカウントを持っていない方はこちら'))
          ],
        ),
      ),
    );
  }
}

class _ViewModel {
  _ViewModel(
      this.emailOnChanged, this.passwordOnChanged, this.email, this.password);

  _ViewModel.fromStateNotifier(BuildContext context)
      : email = context.select<SignInPageState, String>((state) => state.email),
        password =
            context.select<SignInPageState, String>((state) => state.password),
        emailOnChanged = context.watch<SignInPageNotifier>().emailOnChanged,
        passwordOnChanged =
            context.watch<SignInPageNotifier>().passwordOnChanged;

  final String email;
  final String password;
  final void Function(String) emailOnChanged;
  final void Function(String) passwordOnChanged;
}

class _TextField extends StatelessWidget {
  const _TextField({Key key, this.onChanged, this.fieldName}) : super(key: key);

  final Function(String) onChanged;
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(counterText: fieldName),
        ),
      ],
    );
  }
}
