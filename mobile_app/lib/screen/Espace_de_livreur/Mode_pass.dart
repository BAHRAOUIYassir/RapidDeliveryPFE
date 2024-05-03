import 'package:flutter/material.dart';

import '../../widget/Text_widget.dart';
import '../../widget/input_widget.dart';
import '../../widget/widget.dart';

class ModePass extends StatelessWidget {
  const ModePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 393,
                color: Colors.black38, //hada bax image ktwli kahla xwiya
                child: Image.asset(
                  'image/livreur_men.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 90,
                child: Column(
                  children: [
                    text36(name: 'Mode passe oublie', color: Colors.white),
                    const SizedBox(
                      height: 10,
                    ),
                    text18(
                        name: 'Nous avons envoyé un code à votre email',
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    const SizedBox(
                      height: 5,
                    ),
                    text18(
                        name: 'example@gmail.com',
                        color: Colors.white,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 570,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const InputField(hint: "example@gmail.com", label: "EMAIL" , obs: true,),
                    const SizedBox(
                      height: 30,
                    ),
                    button(name: 'envoye le code', sizetext: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget casse({String n = ''}) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.black26,
    ),
    child: Center(
      child: Text(
        n,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
