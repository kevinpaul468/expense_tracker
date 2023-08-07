import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/newtransactions.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {

  UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction= [
    Transaction(id: 't1', title: 'product1', amount: 48.69, date: DateTime.now()),
    Transaction(id: 't2', title: 'product2', amount: 66.53, date: DateTime.now())
  ];

  void _addNewTransaction(String title , double amount){
    final newtx = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());
    setState(() {
      _userTransaction.add(newtx);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction)
      ],
    );
  }
}

