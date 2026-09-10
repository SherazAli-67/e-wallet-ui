import 'package:e_wallet/constants/string_const.dart';
import 'package:e_wallet/core/app_colors.dart';
import 'package:e_wallet/core/app_icons.dart';
import 'package:e_wallet/core/app_textstyles.dart';
import 'package:e_wallet/presentation/widgets/fade_slide_in.dart';
import 'package:e_wallet/presentation/widgets/pressable_scale.dart';
import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: FadeSlideIn(
                  beginScale: 0.92,
                  beginOffset: Offset.zero,
                  child: Image.asset(AppIcons.welcomeCardsWithRings),
                ),
              ),
              Column(
                crossAxisAlignment: .stretch,
                spacing: 24,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 16,
                    children: [
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 120),
                        child: Text(StringConst.welcomeHeadline, style: AppTextStyles.welcomeHeadline,),
                      ),
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 180),
                        child: Text(StringConst.welcomeSubtitle, style: AppTextStyles.welcomeSubtitle,),
                      ),
                    ],
                  ),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 260),
                    child: _buildGetStartedButton(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return PressableScale(
      onTap: () => context.go(NamedRoutes.enterPin.routeName),
      child: Container(
        height: 56,
        width: .infinity,
        alignment: .center,
        decoration: BoxDecoration(
          borderRadius: .circular(10),
          gradient: LinearGradient(
            colors: [
              AppColors.gradientStartColor,
              AppColors.gradientEndColor,
            ],
          ),
        ),
        child: Text(StringConst.getStarted, style: AppTextStyles.buttonLabel,),
      ),
    );
  }
}
