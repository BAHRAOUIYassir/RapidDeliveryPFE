// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'text_widget.dart';

//hada fichier nb9aw nhato fih les buuton wla xi haja xi wiget kt3wd n personalizha hna
Widget Apponbroadpage(PageController controller, BuildContext ctx,
    {String imagepath = "",
    String titre = "",
    String soustitre = "",
    int index = 0,
    String btnTitre = "",
    String SKp = ""}) {
  return Column(
    children: [
      SizedBox(
        height: 300,
        width: 300,
        child: Image.asset(
          imagepath,
          fit: BoxFit.cover,
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
          child: text18(
            name: soustitre,
            color: Colors.black54,
            text: TextAlign.center,
            
          ),
        ),
      ),
      SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _button(index, btnTitre, controller, ctx),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(ctx).pushNamed('loginpage');
              },
              // fhadi hya btton skip li radi dik nichan l login
              child: text24(
                name: SKp,
                color: Colors.black54,
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget _button(
    int index, String titre, PageController controller, BuildContext ctx) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      } else {
        Navigator.of(ctx).pushNamed('loginpage');
      }

      //
      //hna fhad else radi tkon direction l page dyal login
    },
    child: Container(
      height: 60,
      width: 363,
      margin: const EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
        color: const Color(0xFFFF9800),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            offset: Offset(2, 1),
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

// heezz shawod o mse7ha
Widget button({String name = "", double sizetext = 24, Function()? func}) {
  return GestureDetector(
    onTap: () => func,
    child: Container(
      height: 60,
      width: 363,
      decoration: BoxDecoration(
        color: const Color(0xFFFF9800),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            offset: Offset(1, 3),
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontSize: sizetext,
              fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
