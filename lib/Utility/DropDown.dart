import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey,
                    child: DropDownTextField(
                      clearIconProperty:IconProperty(color:Theme.of(context).textTheme.caption?.color),
                      clearOption: true,
                      listSpace: 20,
                      dropdownRadius: 18,
                      listPadding: ListPadding(top: 15),
                      enableSearch: false,
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 10,
                      dropDownList: [
                        DropDownValueModel(name: 'Gym', value: "value1"),
                        DropDownValueModel(name: 'School', value: "value2"),
                        DropDownValueModel(name: 'Groceries', value: "value3"),
                        DropDownValueModel(name: 'subscriptions', value: "value4"),
                        DropDownValueModel(name: 'Home Expense', value: "value5"),
                        DropDownValueModel(name: 'Cloths', value: "value6"),
                        DropDownValueModel(name: 'Lunch Expense', value: "value7"),
                        DropDownValueModel(name: 'Medical Expense', value: "value8"),
                        DropDownValueModel(name: 'Car Expense', value: "value9"),
                        DropDownValueModel(name: 'Electronics', value: "value10"),
                      ],
                      listTextStyle:  TextStyle(color: Colors.black),
                      textFieldDecoration: InputDecoration(
                        hintText: 'Select The Type Of Expense',
                        hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey,)),
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),

                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
