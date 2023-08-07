
import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
                UserTransactions()

              ],
            ),

          ),
    );
  }
}
