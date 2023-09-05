import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart({required this.recentTransaction});
  List<Map<String, Object>> get groupTransactionValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      var totalSum = 0.0;
      for(var i = 0 ; i < recentTransaction.length ; i++){
        if(recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year){
          totalSum += recentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

double get totalSpending{
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
}



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Text('Chart'),
            ...groupTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: data['day'].toString(),
                    spendingAmount: data['amount'] as double,
                    spendingPctOfTotal: totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending),
              );
            }).toList()

      ]),
    );
  }
}
