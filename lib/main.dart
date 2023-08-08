
import 'package:expense_tracker/widgets/newtransactions.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);



 @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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


  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (bctx){
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque ,
      ) ;
    });
  }



  @override
  Widget build(BuildContext context) {
    return
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.teal,
            appBar: AppBar(
              title: Text("Expense Tracker"),
              backgroundColor: Colors.blue,
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
          ),
    );
  }
}
