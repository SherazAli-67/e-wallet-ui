import 'package:e_wallet/constants/string_const.dart';
import 'package:e_wallet/core/app_colors.dart';
import 'package:e_wallet/core/app_icons.dart';
import 'package:e_wallet/core/app_textstyles.dart';
import 'package:e_wallet/presentation/widgets/fade_slide_in.dart';
import 'package:e_wallet/presentation/widgets/pressable_scale.dart';
import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> with SingleTickerProviderStateMixin {
  String _pin = '';
  bool _isPinVisible = false;
  bool _pinBump = false;
  late final AnimationController _glowController;
  late final Animation<double> _glowOpacity;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500))..repeat(reverse: true);
    _glowOpacity = Tween(begin: 0.25, end: 0.45).animate(CurvedAnimation(parent: _glowController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

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
                    FadeSlideIn(
                      duration: const Duration(milliseconds: 400),
                      child: Text(StringConst.enterYourPin, style: AppTextStyles.pinLabel,),
                    ),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 60),
                      duration: const Duration(milliseconds: 400),
                      child: SizedBox(
                        height: 78,
                        child: Center(
                          child: AnimatedScale(
                            scale: _pinBump ? 1.08 : 1,
                            duration: const Duration(milliseconds: 120),
                            curve: Curves.easeOutCubic,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 180),
                              switchInCurve: Curves.easeOutCubic,
                              switchOutCurve: Curves.easeInCubic,
                              transitionBuilder: (child, animation) => FadeTransition(
                                opacity: animation,
                                child: ScaleTransition(scale: animation, child: child,),
                              ),
                              child: Text(_pinDisplay, key: ValueKey('$_pinDisplay$_isPinVisible'), style: AppTextStyles.pinDigits,),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 120),
                      duration: const Duration(milliseconds: 400),
                      child: _buildShowButton(),
                    ),
                  ],
                ),
                Spacer(),
                _buildKeypad(),
                SizedBox(height: 48,),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 280),
                  duration: const Duration(milliseconds: 400),
                  child: Text(StringConst.forgetPin, style: AppTextStyles.forgetPin,),
                ),
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
        child: AnimatedBuilder(
          animation: _glowOpacity,
          builder: (context, child) => Container(
            width: 326,
            height: 326,
            decoration: BoxDecoration(
              shape: .circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryGreenColor.withValues(alpha: _glowOpacity.value),
                  AppColors.primaryGreenColor.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShowButton() {
    return PressableScale(
      onTap: () => setState(() => _isPinVisible = !_isPinVisible),
      child: Container(
        padding: .symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: .circular(64),
          border: .all(color: AppColors.greyColor),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 180),
          child: Text(_isPinVisible ? StringConst.hide : StringConst.show, key: ValueKey(_isPinVisible), style: AppTextStyles.showPin,),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    return Padding(
      padding: .symmetric(horizontal: 16),
      child: Column(
        spacing: 20,
        children: [
          FadeSlideIn(delay: const Duration(milliseconds: 80), duration: const Duration(milliseconds: 400), child: _buildKeypadRow(['1', '2', '3']),),
          FadeSlideIn(delay: const Duration(milliseconds: 130), duration: const Duration(milliseconds: 400), child: _buildKeypadRow(['4', '5', '6']),),
          FadeSlideIn(delay: const Duration(milliseconds: 180), duration: const Duration(milliseconds: 400), child: _buildKeypadRow(['7', '8', '9']),),
          FadeSlideIn(
            delay: const Duration(milliseconds: 230),
            duration: const Duration(milliseconds: 400),
            child: Row(
              spacing: 16,
              children: [
                Expanded(child: _buildKeypadKey(child: SvgPicture.asset(AppIcons.icFingerprint, width: 40, height: 40,),)),
                Expanded(child: _buildKeypadKey(label: '0', onTap: () => _onDigit('0'),)),
                Expanded(child: _buildKeypadKey(child: SvgPicture.asset(AppIcons.icDelete, width: 24, height: 24,), onTap: _onDelete,)),
              ],
            ),
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
    return PressableScale(
      onTap: onTap,
      pressedScale: 0.92,
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
    setState(() {
      _pin += digit;
      _pinBump = true;
    });
    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) setState(() => _pinBump = false);
    });
    if (_pin.length == 5) context.go(NamedRoutes.dashboard.routeName);
  }

  void _onDelete() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }
}
