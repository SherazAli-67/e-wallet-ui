import 'package:e_wallet/core/app_colors.dart';
import 'package:e_wallet/core/app_textstyles.dart';
import 'package:e_wallet/core/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionTile({super.key, required this.transaction,});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: .circle,
            color: AppColors.avatarPlaceholderColor,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 4,
            children: [
              Row(
                children: [
                  Expanded(child: Text(transaction.name, style: AppTextStyles.transactionName, overflow: .ellipsis,)),
                  Text(transaction.amount, style: transaction.isCredit ? AppTextStyles.creditAmount : AppTextStyles.debitAmount,),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(transaction.date, style: AppTextStyles.transactionDate,)),
                  if (transaction.subtitle != null) Text(transaction.subtitle!, style: AppTextStyles.transactionDate,),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
