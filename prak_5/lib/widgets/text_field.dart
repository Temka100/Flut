import 'package:flutter/material.dart';

enum InputFieldType {
  name,
  email,
  password,
  confirmPassword,
}

class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final TextEditingController? passwordController;

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.passwordController,
  });

  @override
  State<CustomTextFormField> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState
    extends State<CustomTextFormField> {
  bool _hidePassword = true;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }

    switch (widget.inputType) {
      case InputFieldType.name:
        final reg = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$');

        if (!reg.hasMatch(value.trim())) {
          return 'Введите имя, используя только буквы и пробелы';
        }

        break;

      case InputFieldType.email:
        final reg = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

        if (!reg.hasMatch(value.trim())) {
          return 'Введите корректный email, например name@mail.com';
        }

        break;

      case InputFieldType.password:
        final reg = RegExp(
          r'^(?=.*[A-Za-zА-Яа-яЁё])(?=.*\d)(?=.*[+_-])[A-Za-zА-Яа-яЁё\d+_-]{6,}$',
        );

        if (!reg.hasMatch(value)) {
          return 'Минимум 6 символов: буквы, цифры и +, _ или -';
        }

        break;

      case InputFieldType.confirmPassword:
        if (value != widget.passwordController?.text) {
          return 'Пароли не совпадают';
        }

        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword =
        widget.inputType == InputFieldType.password ||
            widget.inputType == InputFieldType.confirmPassword;

    return TextFormField(
      controller: widget.controller,
      validator: _validator,
      obscureText: isPassword && _hidePassword,
      keyboardType:
      widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      textInputAction:
      widget.inputType == InputFieldType.confirmPassword
          ? TextInputAction.done
          : TextInputAction.next,
      onFieldSubmitted: (_) {
        if (widget.inputType != InputFieldType.confirmPassword) {
          FocusScope.of(context).nextFocus();
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _hidePassword
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}