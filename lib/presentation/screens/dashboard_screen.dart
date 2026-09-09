import 'package:e_wallet/constants/string_const.dart';
import 'package:e_wallet/core/app_colors.dart';
import 'package:e_wallet/core/app_data.dart';
import 'package:e_wallet/core/app_icons.dart';
import 'package:e_wallet/core/app_textstyles.dart';
import 'package:e_wallet/core/models/contact_model.dart';
import 'package:e_wallet/presentation/widgets/section_header.dart';
import 'package:e_wallet/presentation/widgets/transaction_tile.dart';
import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: .symmetric(horizontal: 16),
              child: _buildAppBar(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: .symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: .stretch,
                  spacing: 40,
                  children: [
                    _buildCardAndActions(),
                    _buildQuickTransaction(),
                    _buildRecentActivity(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        alignment: .center,
        children: [
          Text(StringConst.myDashboard, style: AppTextStyles.screenTitle,),
          Row(
            children: [
              GestureDetector(
                onTap: () => context.go(NamedRoutes.report.routeName),
                child: SvgPicture.asset(AppIcons.icMenu, width: 24, height: 24,),
              ),
              Spacer(),
              SvgPicture.asset(AppIcons.icNotification, width: 24, height: 24,),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardAndActions() {
    return Column(
      spacing: 26,
      children: [
        SingleChildScrollView(
          scrollDirection: .horizontal,
          child: Row(
            spacing: 24,
            children: [
              ClipRRect(
                borderRadius: .circular(12),
                child: Image.asset(AppIcons.cardImg, width: 269, height: 186, fit: .cover,),
              ),
              _buildAddCard(),
            ],
          ),
        ),
        Column(
          spacing: 16,
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(child: _buildActionButton(icon: AppIcons.icTransfer, label: StringConst.transfer,)),
                Expanded(child: _buildActionButton(icon: AppIcons.icPlusCircle, label: StringConst.topUp,)),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(child: _buildActionButton(icon: AppIcons.icScan, label: StringConst.scan,)),
                Expanded(child: _buildActionButton(icon: AppIcons.icReceive, label: StringConst.receive,)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddCard() {
    return CustomPaint(
      painter: _DashedRRectPainter(color: AppColors.primaryGreenColor, radius: 12,),
      child: SizedBox(
        width: 50,
        height: 186,
        child: Center(
          child: Text('+', style: TextStyle(color: AppColors.primaryGreenColor, fontSize: 24, fontWeight: .w400, height: 1,),),
        ),
      ),
    );
  }

  Widget _buildActionButton({required String icon, required String label}) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: .circular(10),
      ),
      child: Row(
        mainAxisAlignment: .center,
        spacing: 8,
        children: [
          SvgPicture.asset(icon, width: 24, height: 24,),
          Text(label, style: AppTextStyles.actionLabel,),
        ],
      ),
    );
  }

  Widget _buildQuickTransaction() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 32,
      children: [
        Text(StringConst.quickTransaction, style: AppTextStyles.sectionTitle,),
        SingleChildScrollView(
          scrollDirection: .horizontal,
          child: Row(
            spacing: 20,
            children: [
              _buildSeeAll(),
              for (final contact in AppData.quickContacts) _buildContact(contact),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSeeAll() {
    return Column(
      spacing: 11,
      children: [
        CustomPaint(
          painter: _DashedCirclePainter(color: AppColors.greyColor,),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: SvgPicture.asset(AppIcons.icChevronRight, width: 20, height: 20,),
            ),
          ),
        ),
        Text(StringConst.seeAll, style: AppTextStyles.contactName,),
      ],
    );
  }

  Widget _buildContact(ContactModel contact) {
    return Column(
      spacing: 11,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: .circle,
            color: AppColors.avatarPlaceholderColor,
          ),
        ),
        Text(contact.name, style: AppTextStyles.contactName,),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      spacing: 24,
      children: [
        SectionHeader(title: StringConst.recentActivity, filterLabel: StringConst.threeDays,),
        Column(
          spacing: 20,
          children: [
            for (final transaction in AppData.recentActivity) TransactionTile(transaction: transaction,),
          ],
        ),
      ],
    );
  }
}

class _DashedRRectPainter extends CustomPainter {
  final Color color;
  final double radius;

  _DashedRRectPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = .stroke
      ..strokeWidth = 1.5;
    final path = Path()..addRRect(RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius)));
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = (distance + 4).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance += 8;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRRectPainter oldDelegate) => oldDelegate.color != color || oldDelegate.radius != radius;
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;

  _DashedCirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = .stroke
      ..strokeWidth = 1.5;
    final path = Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = (distance + 4).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance += 8;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter oldDelegate) => oldDelegate.color != color;
}
