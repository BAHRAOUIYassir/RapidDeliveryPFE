import 'package:flutter/material.dart';

import '../../widget/Text_widget.dart';
import '../../widget/input_widget.dart';
import '../../widget/widget.dart';

class ModePass extends StatelessWidget {
  const ModePass({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              Transform.translate(
                offset: const Offset(0, -25),
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
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
                        const InputField(
                          hint: "example@gmail.com",
                          label: "EMAIL",
                          obs: true,
                        ),
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
        ),
      ),
    );
  }
}
