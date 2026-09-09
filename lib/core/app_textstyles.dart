import 'package:e_wallet/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const _fontFamily = 'Sora';

  static TextStyle get welcomeHeadline => TextStyle(fontFamily: _fontFamily, fontSize: 36, fontWeight: .w500, color: AppColors.whiteColor, height: 1.3);

  static TextStyle get welcomeSubtitle => TextStyle(fontFamily: _fontFamily, fontSize: 16, fontWeight: .w400, color: AppColors.greyColor, height: 1.4);

  static TextStyle get buttonLabel => TextStyle(fontFamily: _fontFamily, fontSize: 16, fontWeight: .w500, color: AppColors.buttonTextColor, height: 1.8);

  static TextStyle get pinLabel => TextStyle(fontFamily: _fontFamily, fontSize: 16, fontWeight: .w400, color: AppColors.greyColor, height: 1.4);

  static TextStyle get pinDigits => TextStyle(fontFamily: _fontFamily, fontSize: 60, fontWeight: .w500, color: AppColors.whiteColor, letterSpacing: 4.8);

  static TextStyle get pinKey => TextStyle(fontFamily: _fontFamily, fontSize: 32, fontWeight: .w500, color: AppColors.whiteColor, height: 1.3);

  static TextStyle get showPin => TextStyle(fontFamily: _fontFamily, fontSize: 14, fontWeight: .w400, color: AppColors.greyColor, height: 1.5);

  static TextStyle get forgetPin => TextStyle(fontFamily: _fontFamily, fontSize: 16, fontWeight: .w400, color: AppColors.primaryGreenColor, height: 1.4);

  static TextStyle get screenTitle => TextStyle(fontFamily: _fontFamily, fontSize: 18, fontWeight: .w500, color: AppColors.whiteColor, height: 1.4);

  static TextStyle get sectionTitle => TextStyle(fontFamily: _fontFamily, fontSize: 18, fontWeight: .w500, color: AppColors.whiteColor, height: 1.4);

  static TextStyle get filterLabel => TextStyle(fontFamily: _fontFamily, fontSize: 14, fontWeight: .w400, color: AppColors.greyColor, height: 1.3);

  static TextStyle get actionLabel => TextStyle(fontFamily: _fontFamily, fontSize: 14, fontWeight: .w400, color: AppColors.whiteColor, height: 1.3);

  static TextStyle get contactName => TextStyle(fontFamily: _fontFamily, fontSize: 14, fontWeight: .w400, color: AppColors.greyColor, height: 1.3);

  static TextStyle get transactionName => TextStyle(fontFamily: _fontFamily, fontSize: 16, fontWeight: .w400, color: AppColors.whiteColor, height: 1.4);

  static TextStyle get transactionDate => TextStyle(fontFamily: _fontFamily, fontSize: 12, fontWeight: .w400, color: AppColors.greyColor, height: 1.3);

  static TextStyle get creditAmount => TextStyle(fontFamily: _fontFamily, fontSize: 16, fontWeight: .w400, color: AppColors.primaryGreenColor, height: 1.4);

  static TextStyle get debitAmount => TextStyle(fontFamily: _fontFamily, fontSize: 16, fontWeight: .w400, color: AppColors.debitRedColor, height: 1.4);

  static TextStyle get balanceLabel => TextStyle(fontFamily: _fontFamily, fontSize: 14, fontWeight: .w400, color: AppColors.greyColor, height: 1.5);

  static TextStyle get balanceAmount => TextStyle(fontFamily: _fontFamily, fontSize: 26, fontWeight: .w500, color: AppColors.whiteColor, height: 1.4);

  static TextStyle get cardBalanceLabel => TextStyle(fontFamily: _fontFamily, fontSize: 14, fontWeight: .w400, color: AppColors.whiteColor, height: 1.3);

  static TextStyle get cardBalanceAmount => TextStyle(fontFamily: _fontFamily, fontSize: 26, fontWeight: .w500, color: AppColors.whiteColor, height: 1.3);

  static TextStyle get cardMeta => TextStyle(fontFamily: _fontFamily, fontSize: 14, fontWeight: .w400, color: AppColors.whiteColor, height: 1.3);

  static TextStyle get chartTooltip => TextStyle(fontFamily: _fontFamily, fontSize: 12, fontWeight: .w400, color: AppColors.whiteColor, height: 1.3);
}
