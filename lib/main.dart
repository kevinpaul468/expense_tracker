
import 'dart:ffi';

import 'package:expense_tracker/widgets/newtransactions.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main(){
  runApp(
      MaterialApp(
        title: "Expense Tracker",
          home :MyApp(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          secondaryHeaderColor: Colors.amber,
        )
      ));
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);



 @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<Transaction> _userTransaction= [];

  void _addNewTransaction(String title , double amount){
    final newtx = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());
    setState(() {
      _userTransaction.add(newtx);
    });
  }


  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (bctx){
      print("entered _startAddNewTransaction");
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque ,
      ) ;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Expense Tracker"),
              actions: [
                IconButton(onPressed: () => _startAddNewTransaction(context), icon: Icon(Icons.add))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
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
                  if (_userTransaction.isEmpty)
                    Column(
                      children: [
                        Text("No transactions added yet!"),
                        SizedBox(height: 20,),
                        Container(
                          height: 200,
                          child: Image.asset("images/waiting.png", fit: BoxFit.cover,),
                        )
                      ],
                    )
                  else
                  TransactionList(_userTransaction)

                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () => _startAddNewTransaction(context),
              child: Icon(
                Icons.add
              ),
            ),

    );
  }
}
