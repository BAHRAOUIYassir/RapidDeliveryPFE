import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid_delivery_app/widget/DropDown_Date_inputs/city_dropdown_menu_widget.dart';
import 'package:rapid_delivery_app/widget/DropDown_Date_inputs/styled_date_field_widget.dart';
import 'package:rapid_delivery_app/widget/DropDown_Date_inputs/vehicle_type_dropdown_menu.dart';
import 'package:rapid_delivery_app/widget/Text_widget.dart';
import 'package:rapid_delivery_app/widget/primary_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var _entredFirstName = '';
  var _entredLastName = '';
  var _entredEmail = '';
  var _entredPassword = '';

  void _handlePrimaryButton(BuildContext context) {
    //*********************Implement Button logic here******************
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const SignInScreen()),
    // );
    _submit();
  }

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  void _submit() {
    final valide = _fromKey.currentState!.validate();
    if (valide) {
      _fromKey.currentState!.save();
      log(_entredFirstName);
      log(_entredLastName);
      log(_entredEmail);
      log(_entredPassword);
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
                          text36(name: "S'inscrire", color: Colors.white),
                          const SizedBox(
                            height: 10,
                          ),
                          text18(
                              name: 'Veuillez vous inscrire pour commencer',
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _fromKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //*********************************First name Field*****************************************/
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "ENTREZ VOTRE PRÉNOM",
                        labelText: "PRENOM",
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
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.characters,
                      onSaved: (value) => _entredFirstName = value!,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Veuillez entrer votre prénom";
                        }
                        return null;
                      },
                    ),
                    /**************************************End************************************************/
                    const SizedBox(
                      height: 30,
                    ),
                    //*********************************Last name Field*****************************************/
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "ENTREZ VOTRE NOM",
                        labelText: "NOM",
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
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.characters,
                      onSaved: (value) => _entredLastName = value!,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Veuillez entrer votre nom";
                        }
                        return null;
                      },
                    ),

                    /**************************************End************************************************/

                    const SizedBox(
                      height: 30,
                    ),
                    const StyledDateFiled(),
                    const SizedBox(
                      height: 30,
                    ),
                    const CityDropdownMenu(),
                    const SizedBox(
                      height: 30,
                    ),
                    const VehicleDropdownMenu(),
                    const SizedBox(
                      height: 30,
                    ),
                    //*********************************Email Field*****************************************/

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

                    /**************************************End************************************************/

                    const SizedBox(
                      height: 30,
                    ),

//*********************************Password Field*****************************************/

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

/**************************************End************************************************/

                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                      textbutton: 'SE CONNECTER',
                      textfontsize: 20,
                      onPressed: () {
                        _handlePrimaryButton(context);
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
