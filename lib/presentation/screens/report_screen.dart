import 'package:e_wallet/constants/string_const.dart';
import 'package:e_wallet/core/app_colors.dart';
import 'package:e_wallet/core/app_data.dart';
import 'package:e_wallet/core/app_icons.dart';
import 'package:e_wallet/core/app_textstyles.dart';
import 'package:e_wallet/presentation/widgets/section_header.dart';
import 'package:e_wallet/presentation/widgets/transaction_tile.dart';
import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

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
                    _buildBalanceAndChart(),
                    _buildTransactionHistory(),
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
          Text(StringConst.report, style: AppTextStyles.screenTitle,),
          Align(
            alignment: .centerLeft,
            child: GestureDetector(
              onTap: () => context.go(NamedRoutes.dashboard.routeName),
              child: SvgPicture.asset(AppIcons.icChevronLeft, width: 24, height: 24,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceAndChart() {
    return Column(
      spacing: 24,
      children: [
        Row(
          crossAxisAlignment: .start,
          children: [
            Column(
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                Text(StringConst.balance, style: AppTextStyles.balanceLabel,),
                Text(AppData.walletCard.balance, style: AppTextStyles.balanceAmount,),
              ],
            ),
            Spacer(),
            Row(
              spacing: 4,
              children: [
                Text(StringConst.monthly, style: AppTextStyles.filterLabel,),
                SvgPicture.asset(AppIcons.icChevronDown, width: 15, height: 15,),
              ],
            ),
          ],
        ),
        Image.asset(AppIcons.statisticReportChart, fit: .contain, width: .infinity,),
      ],
    );
  }

  Widget _buildTransactionHistory() {
    return Column(
      spacing: 24,
      children: [
        SectionHeader(title: StringConst.transactionHistory, filterLabel: StringConst.monthly,),
        Column(
          spacing: 20,
          children: [
            for (final transaction in AppData.reportTransactions) TransactionTile(transaction: transaction,),
          ],
        ),
      ],
    );
  }
}
