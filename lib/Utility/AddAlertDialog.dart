import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:finapp/Utility/Button.dart';
import 'package:flutter/material.dart';

import 'DatePicker.dart';
import 'DropDown.dart';


class DialogBox extends StatefulWidget {
  final  NameController;
  final  AmountController;
  VoidCallback onAdd;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.NameController,
    required this.AmountController,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Container(
          height: 470,
          width: 500,
          child: Column(
            children: [
              Text("By Adding Your Transaction You Can Track Your Expense",style: TextStyle(fontSize: 20,color: Theme.of(context).textTheme.caption?.color),textAlign: TextAlign.center,),

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
              //datepicker
              SizedBox(height: 15,),
              datepicker(),

              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(text: "Add", onPressed: widget.onAdd,),
                  MyButton(text: "Cancel", onPressed: widget.onCancel),
                ],)
            ],
          ),
        ),
      ),
    );
  }
}



