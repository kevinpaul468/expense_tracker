import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

   final Function addtx;

   NewTransaction( this.addtx);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            TextField(
              decoration: InputDecoration(label: Text("Amount")),
              controller: amountController,
            ),
            TextButton(onPressed: (){
              addtx(titleController.text ,
                  double.parse(amountController.text));
            },
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
