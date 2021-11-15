import 'package:chat/components/auth_form.dart';
import 'package:chat/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: AuthForm(),
        ),
      ),
    );
  }
}
