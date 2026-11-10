import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/text_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _registeredName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Map<String, dynamic>) {
        if (args['email'] != null) {
          _emailController.text = args['email'];
        }
        if (args['name'] != null) {
          _registeredName = args['name'];
        }
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    final String email = _emailController.text.trim();

    final String name = _registeredName ??
        email.split('@').first.replaceAll('.', ' ');

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.home,
      arguments: {
        'name': name,
        'email': email,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход в AVpedia'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.security,
                    color: Colors.green,
                    size: 75,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Добро пожаловать!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  CustomTextFormField(
                    inputType: InputFieldType.email,
                    labelText: 'Email',
                    hintText: 'name@mail.com',
                    prefixIcon: Icons.email_outlined,
                    controller: _emailController,
                  ),

                  const SizedBox(height: 16),

                  CustomTextFormField(
                    inputType: InputFieldType.password,
                    labelText: 'Пароль',
                    hintText: 'Введите пароль',
                    prefixIcon: Icons.lock_outline,
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Войти'),
                  ),

                  const SizedBox(height: 12),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.register,
                      );
                    },
                    child: const Text('Создать аккаунт'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}