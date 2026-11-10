import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';
import 'blocs/home/home_bloc.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Map<String, dynamic> _getArguments(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments is Map<String, dynamic>) {
      return arguments;
    }

    return <String, dynamic>{};
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AVpedia',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),

      initialRoute: AppRoutes.loading,

      routes: {
        AppRoutes.loading: (context) => const LoadingPage(),

        AppRoutes.login: (context) => const LoginPage(),

        AppRoutes.register: (context) => const RegisterPage(),

        AppRoutes.home: (context) {
          final arguments = _getArguments(context);

          return BlocProvider(
            create: (_) => HomeBloc()..add(const LoadAntivirusesEvent()),
            child: HomePage(
              name: arguments['name'] as String? ?? 'Пользователь',
              email: arguments['email'] as String? ?? '',
            ),
          );
        },

        AppRoutes.detail: (context) => const DetailPage(),

        AppRoutes.profile: (context) {
          final arguments = _getArguments(context);

          return ProfilePage(
            name: arguments['name'] as String? ?? 'Пользователь',
            email: arguments['email'] as String? ?? '',
          );
        },
      },
    );
  }
}
