import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text("Expense Tracker"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: <Widget> [
            Card(
              child: Container(
                  width: double.infinity ,
                  // height: double.infinity,
                  child: Text("chart- pls holder")
              ),

            ),
            Card(
              child: Container(
                  width: double.infinity,
                  // height: double.infinity,
                  child: Center(
                      child: Text("list of transactions")
                  )
              ),
            )
          ],
        ),

      ),
    )
  );
}