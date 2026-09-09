class TransactionModel {
  final String name;
  final String amount;
  final String date;
  final bool isCredit;
  final String? subtitle;

  const TransactionModel({
    required this.name,
    required this.amount,
    required this.date,
    required this.isCredit,
    this.subtitle,
  });
}
