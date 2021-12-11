import 'package:chat/theme/app_colors.dart';
import 'package:chat/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: AppColors.green),
            const SizedBox(height: 16),
            Text(
              'Carregando...',
              style: AppTextStyles.textLoading,
            ),
          ],
        ),
      ),
    );
  }
}
