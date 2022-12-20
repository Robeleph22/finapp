import 'package:finapp/Utility/Button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: Container(
        height: 300,
        width: 500,
        child: SingleChildScrollView(

          child: Column(
            children: [
              Text("By Adding Your Transaction You Can Track Your Expense",style: TextStyle(fontSize: 20,color: Theme.of(context).textTheme.caption?.color),textAlign: TextAlign.center,),

              SizedBox(height: 25,),

              Column(children:  [
                TextField(
                  controller: NameController,
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
                  controller: AmountController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add Expense Amount",
                    hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                  ),)
              ],),

              // SizedBox(height: 20,),
              //
              // Column(children:  [
              // Form(
              // key: _formKey,
              // child: Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 5),
              // child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // children: [
              // DropDownTextField(
              // listSpace: 20,
              // dropdownRadius: 18,
              // listPadding: ListPadding(top: 20),
              // enableSearch: true,
              // validator: (value) {
              // if (value == null) {
              // return "Required field";
              // } else {
              // return null;
              // }
              // },
              // dropDownList: [
              // DropDownValueModel(name: 'Gym', value: "value1"),
              // DropDownValueModel(name: 'School', value: "value2"),
              // DropDownValueModel(name: 'Groceries', value: "value3"),
              // DropDownValueModel(name: 'subscriptions', value: "value4"),
              // DropDownValueModel(name: 'Home Expense', value: "value5"),
              // DropDownValueModel(name: 'Cloths', value: "value6"),
              // DropDownValueModel(name: 'Lunch Expense', value: "value7"),
              // DropDownValueModel(name: 'Medical Expense', value: "value8"),
              // DropDownValueModel(name: 'Car Expense', value: "value9"),
              // DropDownValueModel(name: 'Electronics', value: "value10"),
              // ],
              // listTextStyle:  TextStyle(color: Colors.black),
              //   textFieldDecoration: InputDecoration(
              //     hintText: 'Select The Type Of Expense',
              //     hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color)
              //   ),
              //   searchDecoration: InputDecoration(
              //     icon: Icon(Icons.search),
              //     iconColor: Colors.black,
              //     hintText: 'Search',
              //     hintStyle: TextStyle(color: Colors.black),
              //   ),
              // dropDownItemCount: 10,
              //
              // onChanged: (val) {},
              // ),
              // ]
              // )
              // )
              // )
              //   ]),
              //
               SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(text: "Add", onPressed: onAdd),
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],)
            ],
          ),
        ),
      ),
    );
  }
}

