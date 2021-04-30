import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';
import 'package:yournoteapp/common/index.dart';
import 'package:yournoteapp/presentation/common_widget/index.dart';
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
            SigningTextField(
              onChanged: _viewModel.emailOnChanged,
              fieldName: 'メールアドレス',
              textInputType: TextInputType.emailAddress,
            ),
            SigningTextField(
              onChanged: _viewModel.passwordOnChanged,
              fieldName: 'パスワード',
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(
              height: 5,
            ),
            SigningElevatedButton(
              onPressed: () async {
                await _buttonPressed(
                  context: context,
                  email: _viewModel.email,
                  password: _viewModel.password,
                  auth: _auth,
                  database: _database
                );
              },
              childText: '送信',
              // TODO(me): バリデーション
              isChanged: true,
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _buttonPressed(
    {@required BuildContext context,
      @required String email,
      @required String password,
      @required AuthUseCaseNotifier auth,
      @required DatabaseUseCaseNotifier database}) async {
  final uid =
      await auth.createUserWithEmailAndPassword(context, email, password);
  if (uid != null) {
    await database.addUser(context, uid, email);
    await showCommonDialog<void>(context, '仮登録完了', '確認メールを送信しました。届いたメールのURLを開いて、本登録を完了させてください。');
    await Navigator.of(context).pushNamed(AppRoutes.signIn);
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
