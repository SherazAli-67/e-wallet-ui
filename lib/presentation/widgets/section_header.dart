import 'package:e_wallet/core/app_icons.dart';
import 'package:e_wallet/core/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String filterLabel;

  const SectionHeader({super.key, required this.title, required this.filterLabel,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.sectionTitle,),
        Spacer(),
        Row(
          spacing: 4,
          children: [
            Text(filterLabel, style: AppTextStyles.filterLabel,),
            SvgPicture.asset(AppIcons.icChevronDown, width: 15, height: 15,),
          ],
        ),
      ],
    );
  }
}
