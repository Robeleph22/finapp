import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:finapp/Utility/Button.dart';
import 'package:flutter/material.dart';
import 'DropDown.dart';


class TransactionDialogBox extends StatefulWidget {
  final  NameController;
  final  AmountController;
  VoidCallback onAdd;
  VoidCallback onCancel;

  TransactionDialogBox({
    super.key,
    required this.NameController,
    required this.AmountController,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  State<TransactionDialogBox> createState() => _TransactionDialogBoxState();
}

class _TransactionDialogBoxState extends State<TransactionDialogBox> {


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: Container(
        height: 360,
        width: 500,
        child: Column(
          children: [
            Text("Add Transaction For Income Or Expense",style: TextStyle(fontSize: 20,color: Theme.of(context).textTheme.caption?.color),textAlign: TextAlign.center,),

            SizedBox(height: 25,),

            Column(children:  [
              TextField(
                controller: widget.NameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add Expense Name",
                  hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                ),)
            ],),


            SizedBox(height: 15,),

            Column(
              children:  [
              TextField(
                controller: widget.AmountController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add Expense Amount",
                  hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                ),)
            ],),

            SizedBox(height: 20,),

            //Dropdown
            dropdown(),

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: widget.onAdd, child: Text("Add",style: TextStyle(fontSize: 18,color: Colors.greenAccent),)),
                TextButton(onPressed: widget.onCancel, child: Text("Cancel",style: TextStyle(fontSize: 18,color: Colors.greenAccent)))
              ],)
          ],
        ),
      ),
    );
  }
}



