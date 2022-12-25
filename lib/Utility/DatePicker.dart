import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class datepicker extends StatefulWidget {
  const datepicker({Key? key}) : super(key: key);

  @override
  State<datepicker> createState() => _datepickerState();
}

class _datepickerState extends State<datepicker> {
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(

            padding: EdgeInsets.all(15),

            child: Center(

                child: TextField(
                  controller: dateInput,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today,color: Colors.blueGrey,),
                      labelText: "Enter Date",
                    labelStyle: TextStyle(color: Colors.white),

                  ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),

                        lastDate: DateTime(2200));

                    if (pickedDate != null) {
                      print(
                          pickedDate);
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate);
                      setState(() {
                        dateInput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                )
            )
    );
  }
}
