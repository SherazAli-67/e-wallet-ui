import 'package:e_wallet/core/models/contact_model.dart';
import 'package:e_wallet/core/models/transaction_model.dart';
import 'package:e_wallet/core/models/wallet_card_model.dart';

class AppData {
  static const walletCard = WalletCardModel(
    balance: '\$ 34,378,44',
    number: '3554 7634 2647 0237',
    exp: '24/26',
  );

  static const quickContacts = [
    ContactModel(name: 'Rendy'),
    ContactModel(name: 'Mitha'),
    ContactModel(name: 'Samuel'),
    ContactModel(name: 'Selena'),
  ];

  static const recentActivity = [
    TransactionModel(name: 'Martin Botosh', amount: '+ \$29,00', date: 'May 29, 2018', isCredit: true),
    TransactionModel(name: 'Skylar Dorwart', amount: '- \$24,52', date: 'May 11, 2018', isCredit: false),
    TransactionModel(name: 'Rayna Dorwart', amount: '- \$14,37', date: 'May 9, 2018', isCredit: false),
    TransactionModel(name: 'Jaydon Korsgaard', amount: '+ \$4,40', date: 'May 2, 2018', isCredit: true),
  ];

  static const reportTransactions = [
    TransactionModel(name: 'Steven Ricardo', amount: '+ \$29,00', date: 'Sunday, 12 Jan 22', isCredit: true),
    TransactionModel(name: 'Idlix', amount: '+ \$29,00', date: 'Sunday, 8 Jan 22', isCredit: true, subtitle: 'Subscribe'),
    TransactionModel(name: 'Melia Purwanti', amount: '- \$14,37', date: 'Friday, 26 Dec 21', isCredit: false),
    TransactionModel(name: 'Robin Swan', amount: '- \$71,57', date: 'Friday, 16 Dec 21', isCredit: false),
  ];

  static const chartTooltip = '+ \$32,00';
}
