import 'package:flutter/material.dart';
import './transaction.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'product1', amount: 48.69, date: DateTime.now()),
    Transaction(id: 't2', title: 'product2', amount: 66.53, date: DateTime.now())
  ];
 MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
        MaterialApp(
          debugShowCheckedModeBanner: true,
          home: Scaffold(
            backgroundColor: Colors.teal,
            appBar: AppBar(
              title: Text("Expense Tracker"),
              backgroundColor: Colors.blue,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                Card(
                  child: Container(
                      width: double.infinity ,

                      child: Text("chart- pls holder")
                  ),
                ),
                Column(
                  children: transactions.map((tx){
                    return Card(
                    child: Text(tx.title),
                    );
                  }).toList(),
                ),
              ],
            ),

          ),

    );
  }
}
