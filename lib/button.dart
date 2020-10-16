import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String char;
  Color bgColor;
  Color charColor;
  final Function function;

  Button({this.char, this.bgColor: const Color(0xff424242), this.charColor:Colors.white, this.function});

  @override
  Widget build(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5, 5),
            blurRadius: 10.0,
          )
        ]
      ),
      width: 70,
        height: 70,
        child: RawMaterialButton(
          onPressed: function,
          child:Text(
          char,
          style: TextStyle(
            color: charColor,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        ),
    );
  }
}


