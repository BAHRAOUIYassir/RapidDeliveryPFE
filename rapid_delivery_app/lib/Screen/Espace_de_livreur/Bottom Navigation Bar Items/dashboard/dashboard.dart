import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _allCommandesCount = 1;
  int _todayCommandesCount = 0;
  String _currentTime = "";
  double _todayEarnings = 0.0;
  double _allEarnings = 0.0;
  String? currentUserEmail;
  int currentDeliveryId = 0;
  var now = DateTime.now();
  late List<ChartData> chartData;

  @override
  void initState() {
    super.initState();
    _getCurrentTime();
    _getCurrentUserEmail();
    _initializeChartData();
  }

  void _initializeChartData() {
    setState(() {
      chartData = [
        ChartData(1, 100, '100%', const Color.fromARGB(255, 105, 221, 94)),
        ChartData(2, 100, '100%', const Color(0xffDD99FD)),
        ChartData(3, 100, '100%', const Color(0xffFFB23E)),
        ChartData(4, 100, '100%', const Color(0xff93C5FF)),
      ];
    });
  }

  void _updateChartData() {
    setState(() {
      chartData = [
        ChartData(
            1,
            _todayCommandesCount.toDouble(),
            '${_allCommandesCount.toDouble()}%',
            const Color.fromARGB(255, 105, 221, 94)),
        ChartData(
            2, _allCommandesCount.toDouble(), '100%', const Color(0xffDD99FD)),
        ChartData(3, _todayEarnings, '100%', const Color(0xffFFB23E)),
        ChartData(4, _allEarnings, '100%', const Color(0xff93C5FF)),
      ];
    });
  }

// Get current user email to use it to get the deliveryId
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _getCurrentUserEmail() async {
    User? user = _auth.currentUser;

    if (user != null) {
      setState(() {
        currentUserEmail = user.email;
      });

      await _getFieldFromFirestore(user.email!);
    }
  }

  // Get the fields of the document that have a field email equal to user.email
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _getFieldFromFirestore(String? email) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users') // Replace with your collection name
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var document = querySnapshot.docs.first;
        setState(() {
          currentDeliveryId = document[
              'deliveryId']; // Replace with the field name you want to retrieve
        });
      }
      log("Delivery id " + currentDeliveryId.toString());
      await _fetchAllCommandesCount();
      await _fetchTodayCommandesCount();
      await _fetchTodayAndAllEarnings();
    } catch (e) {
      log('Error retrieving document: $e');
    }
  }

  Future<void> _fetchAllCommandesCount() async {
    int count = await getAllCommandesCount();
    log("Number of all commandes with deliveryId == $currentDeliveryId: $count");
    setState(() {
      _allCommandesCount = count;
      _updateChartData();
    });
  }

  Future<int> getAllCommandesCount() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('commandes')
          .where('deliveryID', isEqualTo: currentDeliveryId)
          .get();

      return querySnapshot.docs.length;
    } catch (e) {
      log("Error getting all commandes count: $e");
      return 0;
    }
  }

  Future<void> _fetchTodayCommandesCount() async {
    int count = await getTodayCommandesCount();
    log("Number of today commandes with deliveryId == $currentDeliveryId : $count");
    setState(() {
      _todayCommandesCount = count;
      _updateChartData();
    });
  }

  Future<int> getTodayCommandesCount() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('commandes')
          .where('commande date', isEqualTo: _currentTime)
          .where('deliveryID', isEqualTo: currentDeliveryId)
          .get();

      return querySnapshot.docs.length;
    } catch (e) {
      log("Error getting commande today count: $e");
      return 0;
    }
  }

  Future<void> _fetchTodayAndAllEarnings() async {
    String targetDate = _currentTime; // Specify the target date here
    double todayEarnings =
        await getTodayEarnings(targetDate, currentDeliveryId);
    setState(() {
      _todayEarnings = todayEarnings;
    });
    log("Today earnings :$_todayEarnings");

    double allEarnings = await getAllEarnings(currentDeliveryId);
    setState(() {
      _allEarnings = allEarnings;
    });
    log("All earnings :$_allEarnings");
  }

  Future<double> getTodayEarnings(String date, int deliveryId) async {
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

  Future<double> getAllEarnings(int deliveryId) async {
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

  void _getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    setState(() {
      _currentTime = formattedDate;
    });
    log("Current date: $_currentTime");
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
            const SizedBox(height: 50),
            Container(
              child: SfCircularChart(
                series: <RadialBarSeries<ChartData, int>>[
                  RadialBarSeries<ChartData, int>(
                    useSeriesColor: true,
                    trackOpacity: 0.3,
                    cornerStyle: CornerStyle.bothCurve,
                    dataSource: chartData,
                    pointRadiusMapper: (ChartData data, _) => data.text,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData sales, _) => sales.x,
                    yValueMapper: (ChartData sales, _) => sales.y,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container box({
    required Color color,
    required String titre,
    required String valeur,
    required IconData icon,
  }) {
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

class ChartData {
  ChartData(this.x, this.y, this.text, this.color);
  final int x;
  final double y;
  final String text;
  final Color color;
}
