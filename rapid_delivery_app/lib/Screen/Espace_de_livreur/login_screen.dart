// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/forget_password.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/home_screen.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/signup_screen.dart';
import 'package:rapid_delivery_app/widget/Text_widget.dart';
import 'package:rapid_delivery_app/widget/primary_button.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _handleButtonForgetPassword(BuildContext context) {
    //*********************Implement Button logic here******************
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgetPassword()),
    );
  }

  void _handleButtonSignUp(BuildContext context) {
    //*********************Implement Button logic here******************
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  void _handleButtonLogin(BuildContext context) {
    _submit();
  }

  var _entredEmail = '';

  var _entredPassword = '';

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  void _submit() async {
    final valide = _fromKey.currentState!.validate();
    if (valide) {
      _fromKey.currentState!.save();
      log(_entredEmail);
      log(_entredPassword);

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _entredEmail,
          password: _entredPassword,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Authentication failed.'),
          ),
        );
      }
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
              // yassir : dir nafs color f les screen lakhrin
              backgroundColor: const Color.fromARGB(255, 46, 46,
                  46), //Yassir:bash tweli backgroud noire chwiya b7al li f desgin
              expandedHeight: 300,
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
                          text36(name: 'Se connecter', color: Colors.white),
                          const SizedBox(
                            height: 10,
                          ),
                          text18(
                              name:
                                  ' Veuillez vous connecter à votre compte existant',
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
//*********************************************Email Filed*********************************************
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'ENTRER VOTRE EMAIL',
                          labelText: 'EMAIL',
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
                        onSaved: (value) => _entredEmail = value!,
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
                        height: 30,
                      ),

//*********************************************Password Filed*********************************************

                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: '***********',
                          labelText: 'MODE DE PASSE',
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
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        onSaved: (value) => _entredPassword = value!,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Veuillez entrer votre mot de passe';
                          }
                          if (value.length < 8) {
                            return 'Le mot de passe doit contenir au moins 8 caractères';
                          }
                          return null;
                        },
                      ),

//*************************************************End*************************************************
                      Container(
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
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          TextButton(
                              onPressed: () {
                                _handleButtonForgetPassword(context);
                              },
                              child: const Text(
                                'Mot de passe oublié ?',
                                style: TextStyle(
                                    color: Color(0xFFFF9800), fontSize: 15),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 25,
                          ),
                          const Text(
                            "Vous n'avez pas de compte ?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 166, 165, 165),
                                fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {
                              _handleButtonSignUp(context);
                            },
                            child: const Text(
                              "S'inscrire",
                              style: TextStyle(
                                  color: Color(0xFFFF9800), fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      PrimaryButton(
                        textbutton: 'se connecter',
                        textfontsize: 20,
                        onPressed: () {
                          _handleButtonLogin(context);
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
