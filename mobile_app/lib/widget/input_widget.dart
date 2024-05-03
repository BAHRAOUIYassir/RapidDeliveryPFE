//widget dayl input je defini tu peut utilse 
//fiha hint howa placeholder les kykon f input o label 
// howa smya dyal input bhal EMAI MOde pass
//odik obs  hiya fin kyn obcure wax unput wx tban mtlan mode pass 5s tban ***** donc kndiro true
import 'package:flutter/material.dart';

import 'Text_widget.dart';


class InputField extends StatelessWidget {
  const InputField({super.key, required this.hint , required this.label, required this.obs,});

  final String hint;
  final String label;
  final bool obs ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: 348,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffEEF6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: obs,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                hintStyle: const TextStyle(
                  color: Color(0xff838383),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
