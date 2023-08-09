import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

   final Function addtx;

   NewTransaction( this.addtx );

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
   final titleController = TextEditingController();

   final amountController = TextEditingController();

   void submitdata(){
     final enteredTitle = titleController.text;
     final enteredAmount = double.parse( amountController.text);

     if (enteredTitle.isEmpty || enteredAmount <= 0)
       return;
     widget.addtx(titleController.text ,
         double.parse(amountController.text));
   }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              autocorrect: true,
              autofocus: true,
              decoration: InputDecoration(label: Text("Title")),
              controller: titleController,
              onSubmitted: (_) =>submitdata(),
            ),
            TextField(
               keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(label: Text("Amount")),
              controller: amountController,
              onSubmitted: (_) =>submitdata() ,
            ),
            TextButton(onPressed: submitdata,
                child: Text("submit",
                  style: TextStyle(
                      color: Colors.purpleAccent
                  ),)
            )

          ],
        ),
      ),
    );
  }
}
