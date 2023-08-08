import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  child: Text('₹' +
                      transactions[index].amount.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold ,
                        fontSize: 20,
                        color: Colors.red
                    ),

                  ),
                  margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 15 ),
                  decoration: BoxDecoration(border: Border.all(color: Colors.black , width: 2 )),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(transactions[index].date),
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,

      ),
    );
  }
}
