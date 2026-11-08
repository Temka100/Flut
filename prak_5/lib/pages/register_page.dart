import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'profile_page.dart';

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

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.person_add,
                    size: 70,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 12),

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
                    labelText: 'Полное имя',
                    hintText: 'Введите имя',
                    prefixIcon: Icons.person,
                    controller: _nameController,
                  ),

                  const SizedBox(height: 14),

                  CustomTextFormField(
                    inputType: InputFieldType.email,
                    labelText: 'Email',
                    hintText: 'name@mail.com',
                    prefixIcon: Icons.email,
                    controller: _emailController,
                  ),

                  const SizedBox(height: 14),

                  CustomTextFormField(
                    inputType: InputFieldType.password,
                    labelText: 'Пароль',
                    hintText: 'Буквы, цифры и +, _ или -',
                    prefixIcon: Icons.lock,
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 14),

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
                    onPressed: _submit,
                    child: const Text('Зарегистрироваться'),
                  ),


                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
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