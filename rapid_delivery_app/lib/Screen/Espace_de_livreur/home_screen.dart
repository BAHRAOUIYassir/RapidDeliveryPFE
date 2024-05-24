// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/Screen/dashboard.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/Screen/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        'screen': Dashboard(),
        'title': '',
      },
      {
        'screen': Container(),
        'title': 'Offers',
      },
      {
        'screen': Container(),
        'title': 'Wallet',
      },
      {
        'screen': Profile(),
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
          unselectedLabelStyle: TextStyle(fontFamily: 'Karla'),
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
