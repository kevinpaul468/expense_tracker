import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Card(
                  elevation: 7,
                  child: Container(
                      width: double.infinity ,
                      color: Colors.blue,

                      child: Text("chart- pls holder")
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(
                            autocorrect: true,
                          autofocus: true,
                          decoration: InputDecoration(label: Text("Title")),
                        ),
                        TextField(
                          decoration: InputDecoration(label: Text("Amount")),
                        ),
                        TextButton(onPressed: (){

                        },
                            child: Text("submit",
                            style: TextStyle(
                              color: Colors.purpleAccent
                            ),)
                        )

                      ],
                    ),
                  ),
                ),

                Column(
                  children: transactions.map((tx){
                    return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text('₹' +
                              tx.amount.toString(),
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
                                tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black87
                              ),
                            ),
                            Text(
                                DateFormat.yMMMMEEEEd().format(tx.date),
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
                  }).toList(),
                ),
              ],
            ),

          ),
    );
  }
}
