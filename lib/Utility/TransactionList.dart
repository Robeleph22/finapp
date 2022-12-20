import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';


class TransactionList extends StatelessWidget {
  final String TransactionName;
  final String TransactionAmount;
  Function (BuildContext)? DeleteList;

   TransactionList({
    super.key,
    required this.TransactionName,
    required this.TransactionAmount,
    required this.DeleteList,

   });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: DeleteList,
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(TransactionName,style: GoogleFonts.aBeeZee(fontSize: 18,
                          color: Colors.white)),

                      SizedBox(width: 10,),


                      SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset('Icons/dollar.png')),

                      SizedBox(width: 5,),

                      Text(TransactionAmount,style: TextStyle(fontSize: 18,color: Colors.white),)
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
