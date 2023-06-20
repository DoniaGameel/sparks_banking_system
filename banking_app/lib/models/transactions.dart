import 'package:banking_app/models/user_data.dart';

class Transaction {
  final User sender;
  final User reciever;
  final int transactionAmount;

  Transaction(
    this.sender,
    this.reciever,
    this.transactionAmount,
  );
}

List<Transaction> transactionsList = [];
