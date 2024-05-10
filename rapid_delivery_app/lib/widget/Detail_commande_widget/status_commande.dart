// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rapid_delivery_app/widget/text_widget.dart';

class StatusCommande extends StatelessWidget {
  const StatusCommande(
      {super.key,
      required this.Name_status,
      required this.date_status,
      required this.path});
  final String Name_status;
  final String path;
  final String date_status;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: ListTile(
          leading: Image.asset(
            path,
            width: 30,
            height: 30,
          ),
          title: text18(name: Name_status, fontWeight: FontWeight.bold),
          subtitle: Text(date_status)),
    );
  }
}
