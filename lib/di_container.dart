import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yournoteapp/common/index.dart';
import 'package:yournoteapp/common/show_loading_dialog/loading_indicator_state.dart';

import 'repository/data_source/index.dart';
import 'repository/index.dart';
import 'use_case/index.dart';

/// DI container of repository for provider
List<SingleChildWidget> get repositoryProviders {
  return <SingleChildWidget>[
    Provider<AuthRepository>(
      create: (_) => AuthDataSource(),
    ),
    Provider<DatabaseRepository>(
      create: (_) => DatabaseDataSource(),
    ),
  ];
}


/// DI container of use_case for provider
List<SingleChildWidget> get useCaseProviders {
  return <SingleChildWidget>[
    StateNotifierProvider<AuthUseCaseNotifier,AuthUseCaseState>(
      create: (context) => AuthUseCaseNotifier(),
    ),
    StateNotifierProvider<DatabaseUseCaseNotifier,DatabaseUseCaseState>(
      create: (context) => DatabaseUseCaseNotifier(),
    ),
  ];
}

/// DI container of common for provider
List<SingleChildWidget> get commonProviders {
  return <SingleChildWidget>[
    StateNotifierProvider<LoadingIndicatorNotifier, LoadingIndicatorState>(
      create: (context) => LoadingIndicatorNotifier(),
    ),
  ];
}
