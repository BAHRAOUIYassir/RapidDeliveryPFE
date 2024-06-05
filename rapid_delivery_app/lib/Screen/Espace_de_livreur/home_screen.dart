// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/Bottom%20Navigation%20Bar%20Items/dashboard/dashboard.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/Bottom%20Navigation%20Bar%20Items/order/order_screen.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/Bottom%20Navigation%20Bar%20Items/Profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var deliveryId = 0;

  // final user = FirebaseAuth.instance.currentUser;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<void> getDeliveryData() async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   try {
  //     QuerySnapshot querySnapshot = await db
  //         .collection("users")
  //         .where("email", isEqualTo: user?.email)
  //         .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
  //       Map<String, dynamic> data =
  //           documentSnapshot.data() as Map<String, dynamic>;
  //       setState(() {
  //         deliveryId = data['deliveryId'];
  //       });

  //       log("Fetched delivery ID: $deliveryId");
  //     } else {
  //       log("No document found with the specified tracking number");
  //     }
  //   } catch (e) {
  //     log("Error fetching document ID in home screen: $e");
  //   }
  // }

  void _selectScreen(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  int _indexSelected = 0;
  late List<Map<String, dynamic>> _screen;
  @override
  void initState() {
    _screen = [
      {
        'screen': const Dashboard(),
        'title': '',
      },
      {
        'screen': OrderseScreen(),
        'title': 'Offers',
      },
      {
        'screen': Container(),
        'title': 'Wallet',
      },
      {
        'screen': const Profile(),
        'title': 'Profile',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFFF9800),
          title: Text(
            _screen[_indexSelected]['title'],
            style: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          iconTheme: const IconThemeData(size: 45, color: Colors.white),
        ),
        drawer: const Drawer(
          backgroundColor: Colors.white,
        ),
        body: _screen[_indexSelected]['screen'],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          onTap: _selectScreen,
          selectedItemColor: const Color(0xFFFF9800),
          unselectedItemColor: const Color(0xFF898A8D),
          selectedFontSize: 16,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Karla'),
          unselectedLabelStyle: const TextStyle(fontFamily: 'Karla'),
          currentIndex: _indexSelected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Offer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
