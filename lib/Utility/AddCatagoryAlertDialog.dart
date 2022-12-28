import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:finapp/Utility/Button.dart';
import 'package:flutter/material.dart';
import 'DropDown.dart';


class CatagoryDialogBox extends StatefulWidget {
  final  CatagoryNameController;
  final IconController;
  final  TransactionController;
  VoidCallback onAdd;
  VoidCallback onCancel;

  CatagoryDialogBox({
    super.key,
    required this.CatagoryNameController,
    required this.IconController,
    required this.TransactionController,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  State<CatagoryDialogBox> createState() => _CatagoryDialogBoxState();
}

class _CatagoryDialogBoxState extends State<CatagoryDialogBox> {


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
                controller: widget.CatagoryNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add Catagory Name",
                  hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                ),)
            ],),


            SizedBox(height: 15,),

            Column(
              children:  [
                TextField(
                  controller: widget.IconController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Icon Use Emojis",
                    hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                  ),)
              ],),

            SizedBox(height: 20,),

            //Dropdown
            dropdown(
            ),

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

// onChanged: (val) {
// _myBox.put("TYPEOFTRANSACTION", val.value.toString());
// print(val.value.toString());
// },

