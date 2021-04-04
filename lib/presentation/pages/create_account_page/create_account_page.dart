import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';
import 'package:yournoteapp/use_case/auth_use_case/auth_use_case.dart';
import 'package:yournoteapp/use_case/database_use_case/database_use_case.dart';

import 'create_account_page_state.dart';

class CreateAccountPage extends StatelessWidget {
  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<CreateAccountPageNotifier,
            CreateAccountPageState>(
          create: (_) => CreateAccountPageNotifier(),
        )
      ],
      child: CreateAccountPage(),
    );
  }

  // TODO(me): sign inとの共通化、もしくはデザインの差別化

  @override
  Widget build(BuildContext context) {
    final _viewModel = _ViewModel.fromStateNotifier(context);
    final _auth = context.watch<AuthUseCaseNotifier>();
    final _database = context.watch<DatabaseUseCaseNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
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
                onPressed: () async {
                  final uidOrErrorCode =
                      await _auth.createUserWithEmailAndPassword(
                          _viewModel.email, _viewModel.password);
                  if (uidOrErrorCode != 'failed to create account') {
                    await _database.addUser(uidOrErrorCode, _viewModel.email);
                    await Navigator.pushNamed(context, AppRoutes.home);
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)),
                child: const Text('登録'))
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
      : email = context
            .select<CreateAccountPageState, String>((state) => state.email),
        password = context
            .select<CreateAccountPageState, String>((state) => state.password),
        emailOnChanged =
            context.watch<CreateAccountPageNotifier>().emailOnChanged,
        passwordOnChanged =
            context.watch<CreateAccountPageNotifier>().passwordOnChanged;

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
