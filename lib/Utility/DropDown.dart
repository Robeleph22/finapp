import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../DataBase/DataBase.dart';

class dropdown extends StatefulWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  final _myBox = Hive.box('mybox');
  AppDataBase db = AppDataBase();
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
                      print("FU " + value.toString());
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 2,
                      dropDownList: [
                        DropDownValueModel(name: 'Income', value: "Income"),
                        DropDownValueModel(name: 'Expense', value: "Expense"),
                      ],
                      listTextStyle:  TextStyle(color: Colors.black),
                      textFieldDecoration: InputDecoration(
                        hintText: 'Select The Type Of Transaction',
                        hintStyle: TextStyle(color: Theme.of(context).textTheme.caption?.color),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey,)),
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                      onChanged: (val) {
                        _myBox.put("TYPEOFTRANSACTION", val.value.toString());
                        print(val.value.toString());
                      },
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
