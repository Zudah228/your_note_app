import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:yournoteapp/app_routes.dart';
import 'package:yournoteapp/presentation/common_widget/index.dart';
import 'package:yournoteapp/use_case/index.dart';

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
    // キーボードが表示されると上にスクロールされるよう
    final _bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, _bottomSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SigningPageTextField(
                onChanged: _viewModel.userNameOnChanged,
                fieldName: 'ユーザーネーム',
              ),
              SigningPageTextField(
                onChanged: _viewModel.emailOnChanged,
                fieldName: 'メールアドレス',
              ),
              SigningPageTextField(
                onChanged: _viewModel.passwordOnChanged,
                fieldName: 'パスワード',
                obscureText: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      final _auth = context.watch<AuthUseCaseNotifier>();
                      final _database =
                          context.watch<DatabaseUseCaseNotifier>();
                      await createUserAndSignIn(_auth, _database, context, _viewModel.userName,
                          _viewModel.email, _viewModel.password);
                    },
                    style: WidgetStyle.kButtonStyle(context),
                    child: const Text(
                      '登録',
                      style: WidgetStyle.kSigningPageButtonTextStyle,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> createUserAndSignIn(
    AuthUseCaseNotifier auth,
    DatabaseUseCaseNotifier database,
    BuildContext context,
    String userName,
    String email,
    String password) async {
  final uid =
      await auth.createUserWithEmailAndPassword(context, email, password);
  await database.addUser(uid, userName, email);
  await auth.signInWithEmailAndPassword(
      email, password, context, AppRoutes.home);
}

class _ViewModel {
  _ViewModel(
   this.userName, this.emailOnChanged, this.passwordOnChanged, this.email, this.password, this.userNameOnChanged);

  _ViewModel.fromStateNotifier(BuildContext context)
      : userName = context.select<CreateAccountPageState, String>((state) => state.userName),
        email = context
            .select<CreateAccountPageState, String>((state) => state.email),
        password = context
            .select<CreateAccountPageState, String>((state) => state.password),
        userNameOnChanged =
            context.watch<CreateAccountPageNotifier>().userNameOnChanged,
        emailOnChanged =
            context.watch<CreateAccountPageNotifier>().emailOnChanged,
        passwordOnChanged =
            context.watch<CreateAccountPageNotifier>().passwordOnChanged;


  final String userName;
  final String email;
  final String password;
  final void Function(String) userNameOnChanged;
  final void Function(String) emailOnChanged;
  final void Function(String) passwordOnChanged;
}
