import 'package:chat/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final textLoading = GoogleFonts.poppins(
    fontSize: 18,
    color: AppColors.white,
  );

  static final titleLogin = GoogleFonts.poppins(
    fontSize: 32,
    color: AppColors.green,
    fontWeight: FontWeight.bold,
  );

  static final textBase = GoogleFonts.poppins(
    color: AppColors.grey,
  );

  static final textButtonAuth = GoogleFonts.poppins(
    fontSize: 22,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static final textCreateAccount = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.green,
    fontWeight: FontWeight.normal,
  );
}
