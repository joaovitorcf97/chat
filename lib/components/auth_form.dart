import 'dart:ui';

import 'package:chat/core/theme/app_colors.dart';
import 'package:chat/core/theme/app_text_styles.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0, top: 8),
                child: Text(
                  'ChatApp',
                  style: AppTextStyles.titleLogin,
                ),
              ),
              if (_formData.isSignup)
                TextFormField(
                  key: ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name = name,
                  validator: (_name) {
                    final name = _name ?? '';
                    if (name.trim().length < 5) {
                      return 'Nome deve ter no minimo 5 letras';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: AppTextStyles.textBase,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 16),
              TextFormField(
                key: ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                validator: (_email) {
                  final email = _email ?? '';
                  if (!email.contains('@')) {
                    return 'E-mail informado não é válido';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: AppTextStyles.textBase,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                key: ValueKey('password'),
                initialValue: _formData.password,
                onChanged: (password) => _formData.password = password,
                obscureText: true,
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.length < 6) {
                    return 'Senha deve ter no minimo 6 caracteres';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: AppTextStyles.textBase,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(MediaQuery.of(context).size.width, 24),
                  primary: AppColors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  textStyle: AppTextStyles.textButtonAuth,
                ),
                child: _formData.isLogin ? Text('Entrar') : Text('Cadastrar'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  setState(() {
                    _formData.toogleAuthMode();
                  });
                },
                child: Text(
                  _formData.isLogin ? 'Criar uma nova conta?' : 'Já possui conta?',
                  style: AppTextStyles.textCreateAccount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
