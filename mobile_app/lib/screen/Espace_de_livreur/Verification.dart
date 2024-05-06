import 'package:flutter/material.dart';

import '../../widget/Text_widget.dart';
import '../../widget/widget.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.black38, //hada bax image ktwli kahla xwiya
            child: Image.asset(
              'image/livreur_men.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 40,
            child: Column(
              children: [
                text36(name: 'Vérification', color: Colors.white),
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
      Transform.translate(
        offset: const Offset(0, -25),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text18(
                        name: 'CODE',
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                    Row(
                      children: [
                        text18(name: 'Resend', fontWeight: FontWeight.bold),
                        const SizedBox(
                          width: 5,
                        ),
                        text18(
                            name: 'in.50sec',
                            color: Colors.black26,
                            fontWeight: FontWeight.bold)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Casse(n: '2'),
                    Casse(n: '0'),
                    Casse(n: '1'),
                    Casse(n: '5'),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              button(name: 'VÉRIFIER', sizetext: 20),
            ]),
          ),
        ),
      ),
    ]))));
  }
}

Widget Casse({String n = ''}) {
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
