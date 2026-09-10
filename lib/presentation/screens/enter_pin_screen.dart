import 'package:e_wallet/constants/string_const.dart';
import 'package:e_wallet/core/app_colors.dart';
import 'package:e_wallet/core/app_icons.dart';
import 'package:e_wallet/core/app_textstyles.dart';
import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  String _pin = '';
  bool _isPinVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          _buildGlow(),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Column(
                  spacing: 16,
                  children: [
                    //enterYourPin, pinLabel
                    Text(StringConst.enterYourPin, style: AppTextStyles.pinLabel,),
                    // Text(StringConst.enterYourPin, style: AppTextStyles.pinLabel,),

                    //pinDisplay, pinDigits
                    Text(_pinDisplay, style: AppTextStyles.pinDigits,),

                    _buildShowButton(),
                  ],
                ),
                Spacer(),
                _buildKeypad(),
                SizedBox(height: 48,),
                // Text(StringConst.forgetPin, style: AppTextStyles.forgetPin,),
                Text(StringConst.forgetPin, style: AppTextStyles.forgetPin,),
                SizedBox(height: 32,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String get _pinDisplay {
    if (_pin.isEmpty) return '';
    return _isPinVisible ? _pin : '*' * _pin.length;
  }

  Widget _buildGlow() {
    return Positioned(
      left: -87,
      top: -80,
      child: IgnorePointer(
        child: Container(
          width: 326,
          height: 326,
          decoration: BoxDecoration(
            shape: .circle,
            gradient: RadialGradient(
              colors: [
                AppColors.primaryGreenColor.withValues(alpha: 0.35),
                AppColors.primaryGreenColor.withValues(alpha: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShowButton() {
    return GestureDetector(
      onTap: () => setState(() => _isPinVisible = !_isPinVisible),
      child: Container(
        padding: .symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: .circular(64),
          border: .all(color: AppColors.greyColor),
        ),
        child: Text(_isPinVisible ? StringConst.hide : StringConst.show, style: AppTextStyles.showPin,),
      ),
    );
  }

  Widget _buildKeypad() {
    return Padding(
      padding: .symmetric(horizontal: 16),
      child: Column(
        spacing: 20,
        children: [
          _buildKeypadRow(['1', '2', '3']),
          _buildKeypadRow(['4', '5', '6']),
          _buildKeypadRow(['7', '8', '9']),
          Row(
            spacing: 16,
            children: [
              Expanded(child: _buildKeypadKey(child: SvgPicture.asset(AppIcons.icFingerprint, width: 40, height: 40,),)),
              Expanded(child: _buildKeypadKey(label: '0', onTap: () => _onDigit('0'),)),
              Expanded(child: _buildKeypadKey(child: SvgPicture.asset(AppIcons.icDelete, width: 24, height: 24,), onTap: _onDelete,)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeypadRow(List<String> digits) {
    return Row(
      spacing: 16,
      children: [
        for (final digit in digits) Expanded(child: _buildKeypadKey(label: digit, onTap: () => _onDigit(digit),)),
      ],
    );
  }

  Widget _buildKeypadKey({String? label, Widget? child, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        alignment: .center,
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: .circular(208),
        ),
        child: label != null ? Text(label, style: AppTextStyles.pinKey,) : child,
      ),
    );
  }

  void _onDigit(String digit) {
    if (_pin.length >= 5) return;
    setState(() => _pin += digit);
    if (_pin.length == 5) context.go(NamedRoutes.dashboard.routeName);
  }

  void _onDelete() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }
}
