// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../widget/Text_widget.dart';

//hada fichier nb9aw nhato fih les buuton wla xi haja xi wiget kt3wd n personalizha hna
Widget Apponbroadpage(
  PageController controller, {
  String imagepath = "",
  String titre = "",
  String soustitre = "",
  int index = 0,
  String btnTitre = "",
}) {
  return Column(
    children: [
      SizedBox(
        height: 300,
        width: 300,
        child: Image.asset(
          imagepath,
          fit: BoxFit.cover,
          // width: 500,
          // height: 500,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: text24(name: titre),
      ),
      SizedBox(
        height: 140,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: text18(name: soustitre, color: Colors.black54),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      _button(index, btnTitre, controller),
      const SizedBox(
        height: 10,
      ),
      GestureDetector(
        // onTap: () => loginpage(),
        // fhadi hya btton skip li radi dik nichan l login
        child: text24(
          name: 'Skip',
          color: Colors.black54,
        ),
      )
    ],
  );
}

Widget _button(int index, String titre, PageController controller) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      } else {}

      //
      //hna fhad else radi tkon direction l page dyal login
    },
    child: Container(
      height: 60,
      width: 363,
      margin: const EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
        color: Color(0xFFFF9800),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            offset: Offset(2, 2),
            color: Colors.black12,
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(
          titre,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500), // Adjust text style as needed
        ),
      ),
    ),
  );
}

//hadi button zid ila htjitha
Widget button({String name = "", double sizetext = 24}) {
  return Container(
    height: 60,
    width: 363,
    margin: const EdgeInsets.only(top: 100),
    decoration: BoxDecoration(
      color: const Color(0xFFFF9800),
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: const [
        BoxShadow(
          spreadRadius: 1,
          offset: Offset(2, 2),
          color: Colors.black12,
          blurRadius: 2,
        ),
      ],
    ),
    child: Center(
      child: Text(
        name,
        style: TextStyle(
            color: Colors.white,
            fontSize: sizetext,
            fontWeight: FontWeight.w500), // Adjust text style as needed
      ),
    ),
  );
}
