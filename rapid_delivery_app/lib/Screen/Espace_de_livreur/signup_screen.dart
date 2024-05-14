// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/signup_successfully.dart';
import 'package:rapid_delivery_app/widget/Text_widget.dart';
import 'package:rapid_delivery_app/widget/primary_button.dart';

// final _firbase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _firstName = '';

  var _lastName = '';

  var _email = '';

  // var _password='';

  var _cityName = '';

  var _vehiculeType = '';

  var _phoneNumber = '';

  final TextEditingController _dateController = TextEditingController();

  final _value = '-1';
  

  final DateTime _registerDate = DateTime.now();

  void _handlePrimaryButton(BuildContext context) {
    _submit();
  }

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  void _submit() async {
    final valide = _fromKey.currentState!.validate();
    if (valide) {
      _fromKey.currentState!.save();
      // log(_firstName);
      // log(_lastName);
      // log(_email);
      // log(_cityName);
      // log(_vehiculeType);
      // log(_dateController.text);
      // log('${_registerDate.day}-${_registerDate.month}-${_registerDate.year}');

      // try {
      //   final userCredential =
      //       await _firbase.createUserWithEmailAndPassword(
      //     email: _email,
      //     password: _password,
      //   );
      // } on FirebaseAuthException catch (e) {
      //   ScaffoldMessenger.of(context).clearSnackBars();
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(e.message ?? 'Authentication failed.'),
      //     ),
      //   );
      // }

      //add informations
      addUserDetails(_firstName.trim(), _lastName.trim(), _dateController.text,
          _cityName, _vehiculeType, _phoneNumber, _email, _registerDate);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpSuccessfuly()),
      );
    }
  }

  Future addUserDetails(
      String firstName,
      String lastName,
      String birthaydate,
      String cityName,
      String vehiculeType,
      String phoneNumber,
      String email,
      DateTime registerDate) async {
    await FirebaseFirestore.instance.collection('users').add(
      {
        'first name': _firstName,
        'last name': _lastName,
        'birthday date': _dateController.text,
        'city': _cityName,
        'vehicule type': _vehiculeType,
        'phone number': _phoneNumber,
        'email': _email,
        'register date': _registerDate,
      },
    );
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
                      onSaved: (value) => _firstName = value!,
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
                      onSaved: (value) => _lastName = value!,
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
//*********************************Birthday date Field*****************************************/

                    TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        labelText: 'DATE DE NAISSANCE',
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
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate(context);
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Veuillez entrer votre date de naissance';
                        }
                        return null;
                      },
                    ),

//**************************************End************************************************/

                    const SizedBox(
                      height: 30,
                    ),
//*********************************City name Field*****************************************/

                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'VILLE',
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
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      value: _value,
                      items: const [
                        DropdownMenuItem(
                          value: '-1',
                          enabled: false,
                          child: Text(
                            'CHOISIR TA VILLE',
                          ),
                        ),
                        DropdownMenuItem(
                          value: '1',
                          child: Text('OUED ZEM'),
                        ),
                        DropdownMenuItem(
                          value: '2',
                          child: Text('MEKNES'),
                        ),
                        DropdownMenuItem(
                          value: '3',
                          child: Text('KHENIFRA'),
                        ),
                      ],
                      validator: (value) {
                        if (value == '-1') {
                          return "Veuillez entrer votre ville";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          switch (value) {
                            case '1':
                              _cityName = 'OUED ZEM';
                              break;
                            case '2':
                              _cityName = 'MEKNES';
                              break;
                            case '3':
                              _cityName = 'KHENIFRA';
                              break;
                            default:
                          }
                        });
                      },
                    ),

//**************************************End************************************************/

                    const SizedBox(
                      height: 30,
                    ),
//*********************************Vehicule type Field*****************************************/

                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'VÉHICULE',
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
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      value: _value,
                      items: const [
                        DropdownMenuItem(
                          value: '-1',
                          enabled: false,
                          child: Text(
                            'TYPE DE VÉHICULE',
                          ),
                        ),
                        DropdownMenuItem(
                          value: '1',
                          child: Text('Voiture'),
                        ),
                        DropdownMenuItem(
                          value: '2',
                          child: Text('Moto'),
                        ),
                        DropdownMenuItem(
                          value: '3',
                          child: Text('Vélo'),
                        ),
                        DropdownMenuItem(
                          value: '4',
                          child: Text('Scooter électrique'),
                        ),
                      ],
                      validator: (value) {
                        if (value == '-1') {
                          return "Veuillez entrer votre type de vehicule";
                        }
                        return null;
                      },
                      onChanged: (value) => setState(
                        () {
                          switch (value) {
                            case '1':
                              _vehiculeType = 'Voiture';
                              break;
                            case '2':
                              _vehiculeType = 'Moto';
                              break;
                            case '3':
                              _vehiculeType = 'Vélo';
                              break;
                            case '4':
                              _vehiculeType = 'Scooter électrique';
                              break;
                            default:
                          }
                        },
                      ),
                    ),

//**************************************End************************************************/

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
                      onSaved: (value) => _email = value!,
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
//*********************************Phone number Field*****************************************/

                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
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
                      initialCountryCode: 'MA',
                      keyboardType: TextInputType.phone,
                      onSaved: (value) => _phoneNumber = value!.completeNumber,
                    ),

/**************************************End************************************************/

//*********************************Password Field*****************************************/

                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     hintText: '***********',
                    //     labelText: 'MODE DE PASSE',
                    //     labelStyle: TextStyle(color: Colors.black),
                    //     filled: true,
                    //     fillColor: Color.fromARGB(255, 238, 243, 253),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //           color: Color.fromARGB(255, 255, 171, 74),
                    //           width: 2.0),
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(12),
                    //         bottomRight: Radius.circular(12),
                    //       ),
                    //     ),
                    //   ),
                    //   obscureText: true,
                    //   enableSuggestions: false,
                    //   autocorrect: false,
                    //   enableInteractiveSelection: false,
                    //   keyboardType: TextInputType.text,
                    //   textCapitalization: TextCapitalization.none,
                    //   onSaved: (value) => _password = value!,
                    //   validator: (value) {
                    //     if (value == null || value.trim().isEmpty) {
                    //       return 'Veuillez entrer votre mot de passe';
                    //     }
                    //     if (value.length < 8) {
                    //       return 'Le mot de passe doit contenir au moins 8 caractères';
                    //     }
                    //     return null;
                    //   },
                    // ),

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

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
        firstDate: DateTime(1950),
        lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)));

    if (picked != null) {
      _dateController.text = picked.toString().split(" ")[0];
    }
  }
}
