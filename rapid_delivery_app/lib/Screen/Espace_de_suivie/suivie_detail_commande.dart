import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/Detail_commande_widget/timel_line_widget.dart';

class Detailcommande extends StatefulWidget {
  const Detailcommande({super.key, required this.trackingNumber});
  final String trackingNumber;

  @override
  State<Detailcommande> createState() => _DetailcommandeState();
}

class _DetailcommandeState extends State<Detailcommande> {
  var deliveryName = '';
  var deliveryId = '';
  var deliveryPhoneNumber = '';
  var deliveryPucture = '';
  var status = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // Fetch delivery ID and then fetch student details
    fetchDeliveryDetails();
  }

  //for make call phone
  void _makeCall(String number) async {
    if (number.isNotEmpty) {
      final Uri launchUri = Uri(scheme: 'tel', path: number);
      if (!await launchUrl(launchUri)) {
        log("Could not launch Phone number");
      }
    } else {
      log("Phone number is empty");
    }
  }

  //for send message wathssap
  void _launchWhatsApp(String phone) async {
    final Uri launchUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phone,
    );

    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      log("Could not launch WhatsApp");
    }
  }

  Future<void> fetchDeliveryDetails() async {
    await getDocumentId();
    if (deliveryId.isNotEmpty) {
      await _fetchDeliveres();
    }
  }

  Future<void> getDocumentId() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await db
          .collection("commandes")
          .where("tracking number", isEqualTo: widget.trackingNumber)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          deliveryId = data['deliveryID'];
          status = data['commande status'];
          isDelivered();
        });

        log("Fetched delivery ID: $deliveryId");
        log("Fetched status: $status");
      } else {
        log("No document found with the specified tracking number");
      }
    } catch (e) {
      log("Error fetching document ID command detail screen: $e");
    }
  }

  Future<void> _fetchDeliveres() async {
    try {
      // Get the document reference
      DocumentReference docRef = _firestore.collection('users').doc(deliveryId);

      // Get the document from the reference
      DocumentSnapshot docSnapshot = await docRef.get();

      // Check if the document exists
      if (docSnapshot.exists) {
        var data = docSnapshot.data() as Map<String, dynamic>;

        // Ensure you use the correct fields for first name and phone number
        setState(() {
          deliveryName =
              data['first name'] + ' ' + data['last name'] ?? 'No name';
          deliveryPhoneNumber = data['phone number'] ?? 'No phone number';
        });

        log("Fetched delivery name: $deliveryName");
        log("Fetched delivery phone number: $deliveryPhoneNumber");
      } else {
        log("Document with ID $deliveryId does not exist.");
      }
    } catch (e) {
      log("Error fetching student: $e");
    }
  }

  bool confirmed = false;
  bool inProgress = false;
  bool delivred = false;

  void isDelivered() {
    if (status == 'confirmed') {
      confirmed = true;
    }
    if (status == 'in_progress') {
      confirmed = true;
      inProgress = true;
    }
    if (status == 'delivered') {
      confirmed = true;
      inProgress = true;
      delivred = true;
    }
  }

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(32.885503336563595, -6.916860354580724),
    zoom: 13,
  );

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Detail Commande',
            style: TextStyle(fontSize: 24),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'Support',
                  child: Row(
                    children: [
                      Icon(Icons.support_agent),
                      SizedBox(width: 8),
                      Text('Support'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'History',
                  child: Row(
                    children: [
                      Icon(Icons.history),
                      SizedBox(width: 8),
                      Text('History'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              mapType: MapType.terrain,
              liteModeEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.15,
              minChildSize: 0.15,
              maxChildSize: 0.55,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).hintColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 4,
                            width: 40,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              child: ListTile(
                                minLeadingWidth: 60,
                                leading: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('image/Livreur.jpg'),
                                ),
                                title: Text(deliveryName,
                                    style: const TextStyle(fontSize: 20)),
                                subtitle: const Text('Rapid Delivery',
                                    style: TextStyle(fontSize: 18)),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _makeCall(deliveryPhoneNumber),
                                      icon: const Icon(Icons.phone),
                                      color: Colors.green,
                                      iconSize: 40,
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          _launchWhatsApp(deliveryPhoneNumber),
                                      icon: const FaIcon(
                                          FontAwesomeIcons.whatsapp),
                                      color: Colors.green,
                                      iconSize: 40,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    MyTimeLineTile(
                                      isFirst: true,
                                      isPast: confirmed,
                                      isLast: false,
                                      NameStatus: 'Preparing for shipping',
                                      Date_staus: '13/07/2023',
                                      path: 'image/en-cours.png',
                                    ),
                                    MyTimeLineTile(
                                      isFirst: false,
                                      isPast: inProgress,
                                      isLast: false,
                                      NameStatus: 'In the process of delivery',
                                      Date_staus: '14/07/2023',
                                      path: 'image/livreur.png',
                                    ),
                                    MyTimeLineTile(
                                      isFirst: false,
                                      isPast: delivred,
                                      isLast: true,
                                      NameStatus: 'Delivered',
                                      Date_staus: '15/07/2023',
                                      path: 'image/delivery.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
