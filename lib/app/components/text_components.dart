

import 'package:flutter/material.dart';

class TextComponents extends StatelessWidget {

Color color;
double txtsize ; 
FontWeight fw;
TextAlign txtalign;
String txt ;
String family;

TextComponents({required this.txt,
this.color = Colors.black,
this.txtsize = 18,
this.fw = FontWeight.normal,
this.txtalign = TextAlign.left,
this.family = "Regular",});


  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontFamily: family,
        color: color,
        fontSize: txtsize,
        fontWeight: fw,
      ),
      textAlign: txtalign,
    );
  }
}