// ignore: file_names
import 'package:flutter/material.dart';

//hada fih le wiget dayl le text
Widget text24({String name = '', Color color = Colors.black}) {
  return Text(
    name,
    style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.w900),
  );
}

Widget text18(
    {String name = '',
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    name,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: fontWeight,
    ),
  );
}

Widget text36({String name = '', Color color = Colors.white}) {
  return Text(
    name,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 36,
    ),
  );
}

Widget Textlabel(
    {String name = '',
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    name,
    textAlign: TextAlign.left,
    style: TextStyle(
      color: color,
      fontSize: 15,
      fontWeight: fontWeight,
    ),
  );
}
