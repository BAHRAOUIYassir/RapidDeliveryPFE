import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../widget/char_container/chart_container.dart';
import '../chart/bar_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _allCommandesCount = 0;
  int _todayCommandesCount = 0;
  String _currentTime = "";
  double _todayEarnings = 0.0;
  double _allEarnings = 0.0;


  // toString().split(" ")[0]
  var now = DateTime.now();

  Future<void> _fetchAllCommandesCount() async {
    int count = await getAllCommandesCount();
    log("Number of all commandes with deliveryId == 1: $count");
    setState(() {
      _allCommandesCount = count;
    });
  }

  Future<int> getAllCommandesCount() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('commandes')
          .where('deliveryID', isEqualTo: "1")
          .get();

      return querySnapshot.docs.length;
    } catch (e) {
      log("Error getting all commandes count: $e");
      return 0;
    }
  }

  //

  Future<void> _fetchTodayCommandesCount() async {
    int count = await getTodayCommandesCount();
    log("Number of today commandes with deliveryId == 1: $count");
    setState(() {
      _todayCommandesCount = count;
    });
  }

  Future<int> getTodayCommandesCount() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('commandes')
          .where('commande date', isEqualTo: _currentTime)
          .where('deliveryID', isEqualTo: "1")
          .get();

      return querySnapshot.docs.length;
    } catch (e) {
      log("Error getting commande today count: $e");
      return 0;
    }
  }

  //

  //

  void _fetchTodayAndAllEarnings() async {
    String targetDate = _currentTime; // Specify the target date here
    double todayEarnings = await getTodayEarnings(targetDate, "1");
    setState(() {
      _todayEarnings = todayEarnings;
    });
    log("Today earinngs :$_todayEarnings");

    double allEarnings = await getAllEarnings("1");
    setState(() {
      _allEarnings = allEarnings;
    });
    log("All earinngs :$_allEarnings");
  }

  Future<double> getTodayEarnings(String date, String deliveryId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('commandes')
          .where('commande date', isEqualTo: date)
          .where('deliveryID', isEqualTo: deliveryId)
          .get();

      double totalEarnings = 0.0;
      for (var doc in querySnapshot.docs) {
        totalEarnings += doc['commande profit'] ??
            0.0; // Assuming 'earning' is the field name
      }

      return totalEarnings;
    } catch (e) {
      print("Error getting today's earnings: $e");
      return 0.0;
    }
  }

  //

  //88888888888888888888888
  Future<double> getAllEarnings(String deliveryId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('commandes')
          .where('deliveryID', isEqualTo: deliveryId)
          .get();

      double totalEarnings = 0.0;
      for (var doc in querySnapshot.docs) {
        totalEarnings += doc['commande profit'] ??
            0.0; // Assuming 'earning' is the field name
      }
      return totalEarnings;
    } catch (e) {
      print("Error getting today's earnings: $e");
      return 0.0;
    }
  }

  //
  void _getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    setState(() {
      _currentTime = formattedDate;
    });
    log("Current date: $_currentTime");
  }

  @override
  void initState() {
    super.initState();
    _getCurrentTime();
    _fetchAllCommandesCount();
    _fetchTodayCommandesCount();
    _fetchTodayAndAllEarnings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffFF9800),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: box(
                    color: const Color.fromARGB(255, 105, 221, 94),
                    titre: "Order Today",
                    valeur: _todayCommandesCount.toString(),
                    icon: FontAwesomeIcons.box,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: box(
                    color: const Color(0xffDD99FD),
                    titre: "All Order",
                    valeur: _allCommandesCount.toString(),
                    icon: FontAwesomeIcons.listAlt,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: box(
                    color: const Color(0xffFFB23E),
                    titre: "Today Earning",
                    valeur: _todayEarnings.toString(),
                    icon: FontAwesomeIcons.dollarSign,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: box(
                    color: const Color(0xff93C5FF),
                    titre: "Total Earning",
                    valeur: _allEarnings.toString(),
                    icon: FontAwesomeIcons.wallet,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
              ChartContainer(
                title: 'Order week',
                color: const Color(0xff46426c),
                chart: BarChartContent(),//salim: hna atmxi data/order_data.dart hna fin rdi importer data 
              ),
          ],
        ),
      ),
    );
  }

  Container box(
      {required Color color,
      required String titre,
      required String valeur,
      required IconData icon}) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titre,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  valeur,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          FaIcon(
            icon,
            size: 50,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
