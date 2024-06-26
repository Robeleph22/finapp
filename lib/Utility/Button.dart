import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   MyButton({
     Key? key,
     required this.text,
     required this.onPressed,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      color: Colors.blueGrey.shade900,
      child: Text(text,style: TextStyle(color: Colors.white),),
    );
  }
}
