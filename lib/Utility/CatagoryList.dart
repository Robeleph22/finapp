import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';


class CatagoryList extends StatefulWidget {
  final String CatagoryName;
  final String Icon;
  final String TransactionType;
  Function (BuildContext)? DeleteList;

  CatagoryList({
    super.key,
    required this.CatagoryName,
    required this.Icon,
    required this.TransactionType,
    required this.DeleteList,

  });

  @override
  State<CatagoryList> createState() => _CatagoryListState();
}

class _CatagoryListState extends State<CatagoryList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.DeleteList,
              icon: Icons.delete_forever,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment. center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(widget.CatagoryName,style: GoogleFonts.aBeeZee(fontSize: 18,
                          color: Colors.white)),

                      SizedBox(width: 5,),

                      Text(widget.Icon,style: GoogleFonts.aBeeZee(fontSize: 18,
                          color: Colors.white)),

                      SizedBox(width: 5,),

                      Text(widget.TransactionType,style: TextStyle(fontSize: 18,color: Colors.white),),


                    ],
                  )
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              ),

            ],
          ),
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );

  }
}
