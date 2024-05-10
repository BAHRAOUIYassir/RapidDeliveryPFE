import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_suivie/suivie_detail_commande.dart';
import 'package:rapid_delivery_app/widget/primary_button.dart';

import '../../widget/Text_widget.dart';

class Suive_Commande extends StatelessWidget {
  Suive_Commande({super.key});

  void _handleButtonSendingVerificationCode(BuildContext context) {
    //*********************Implement Button logic here******************
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const ForgetPassword()),
    // );
    _submit();
  }

  var _entredForgetPasswordEmail = '';

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  void _submit() {
    final valide = _fromKey.currentState!.validate();
    if (valide) {
      _fromKey.currentState!.save();
      log(_entredForgetPasswordEmail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 40,
              elevation: 20,
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 88, 88,
                  88), //Yassir:bash tweli backgroud noire chwiya b7al li f desgin
              expandedHeight: 270.0,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.black38, //hada bax image ktwli kahla xwiya
                      child: Image.asset(
                        'image/livreur_men.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      child: Column(
                        children: [
                          text36(
                              name: 'Suivre ma commande', color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Form(
              key: _fromKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    //*********************************************Email Filed*********************************************
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter tracking number',
                        labelText: 'Tracking',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Color.fromARGB(255, 238, 243, 253),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 171, 74),
                              width: 2.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      onSaved: (value) => _entredForgetPasswordEmail = value!,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Veuillez entrer votre adresse e-mail";
                        }
                        if (!EmailValidator.validate(value)) {
                          // Assurez-vous d'importer le package email_validator
                          return 'Veuillez entrer une adresse e-mail valide';
                        }
                        return null;
                      },
                    ),

                    //*************************************************End*************************************************
                    const SizedBox(
                      height: 15,
                    ),
                    PrimaryButton(
                      textbutton: 'Suivi ma commande',
                      textfontsize: 20,
                      onPressed: () {
                        _handleButtonSendingVerificationCode(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detailcommande()),
                        );
                      },
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
