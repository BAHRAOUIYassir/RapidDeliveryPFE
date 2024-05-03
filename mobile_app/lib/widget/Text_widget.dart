

//hada fih le wiget dayl le text 
import 'package:flutter/material.dart';

Widget text24({String name = '', Color color = Colors.black}) {
  return Text(
    name,
    style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.w900),
  );
}

Widget text18({String name = '', Color color = Colors.black}) {
  return Text(
    name,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 18,
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

