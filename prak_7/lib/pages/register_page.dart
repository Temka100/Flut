import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/text_field.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _register() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Регистрация прошла успешно. Теперь войдите.'),
      ),
    );

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.login,
      arguments: {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
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
                    Icons.person_add_alt_1,
                    color: Colors.green,
                    size: 70,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Создание аккаунта',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  CustomTextFormField(
                    inputType: InputFieldType.name,
                    labelText: 'Имя',
                    hintText: 'Введите ваше имя',
                    prefixIcon: Icons.person_outline,
                    controller: _nameController,
                  ),

                  const SizedBox(height: 16),

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
                    hintText: 'Придумайте пароль',
                    prefixIcon: Icons.lock_outline,
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 16),

                  CustomTextFormField(
                    inputType: InputFieldType.confirmPassword,
                    labelText: 'Подтверждение пароля',
                    hintText: 'Повторите пароль',
                    prefixIcon: Icons.lock_outline,
                    controller: _confirmPasswordController,
                    passwordController: _passwordController,
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Зарегистрироваться'),
                  ),

                  const SizedBox(height: 12),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.login,
                      );
                    },
                    child: const Text('Уже есть аккаунт? Войти'),
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