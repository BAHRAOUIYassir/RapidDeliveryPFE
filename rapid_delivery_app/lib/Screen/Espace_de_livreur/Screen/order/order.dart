import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/Screen/data/order_data.dart';

import 'target_maps.dart';

class CommandeScreen extends StatefulWidget {
  final String deliveryID;

  const CommandeScreen({super.key, required this.deliveryID});

  @override
  // ignore: library_private_types_in_public_api
  _CommandeScreenState createState() => _CommandeScreenState();
}

class _CommandeScreenState extends State<CommandeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Commande> _commandes = []; //list dyal commend min base de donner
  bool _selectAll = false; //selct all commande
  String _distance = "";

  Future<void> _fetchCommandes() async {
    QuerySnapshot snapshot = await _firestore
        .collection('commandes')
        .where('deliveryID', isEqualTo: widget.deliveryID)
        .get();
    setState(() {
      _commandes =
          snapshot.docs.map((doc) => Commande.fromFirestore(doc)).toList();
    });
  }

  Future<void> _calculateTotalDistance() async {
    try {
      double totalDistance = 0.0;
      List<Location> previousLocation = [];

      for (var commande in _commandes) {
        if (commande.isSelected) {
          List<Location> locations =
              await locationFromAddress(commande.deliveryAddress);
          if (locations.isNotEmpty) {
            if (previousLocation.isNotEmpty) {
              double distanceInMeters = Geolocator.distanceBetween(
                previousLocation[0].latitude,
                previousLocation[0].longitude,
                locations[0].latitude,
                locations[0].longitude,
              );
              totalDistance += distanceInMeters;
            }
            previousLocation = locations;
          }
        }
      }

      setState(() {
        _distance = (totalDistance / 1000).toStringAsFixed(2) + " km";
      });
    } catch (e) {
      setState(() {
        _distance = "Error calculating distance";
      });
    }
  }

  void _toggleSelection(Commande commande) {
    setState(() {
      commande.isSelected = !commande.isSelected;
    });
  }

  void _toggleSelectAll() {
    setState(() {
      _selectAll = !_selectAll;
      for (var commande in _commandes) {
        commande.isSelected = _selectAll;
      }
    });
  }

  Future<List<Location>> _getLocations(List<Commande> commandes) async {
    List<Location> locations = [];
    for (var commande in commandes) {
      if (commande.isSelected) {
        List<Location> location =
            await locationFromAddress(commande.deliveryAddress);
        if (location.isNotEmpty) {
          locations.add(location[0]);
        }
      }
    }
    return locations;
  }

  @override
  void initState() {
    super.initState();
    _fetchCommandes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      color: !_selectAll
                          ? const Color(0xffEEF6FF)
                          : Colors.black38,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.centerRight,
                  child: Center(
                    child: TextButton(
                      onPressed: _toggleSelectAll,
                      child: Text(
                        "All",
                        style: TextStyle(
                          color: !_selectAll ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.navigation),
                  onPressed: () async {
                    _calculateTotalDistance(); //calculeur la distance
                    List<Location> locations = await _getLocations(_commandes);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TargetMaps(
                          distance: _distance,
                          nbrorder:
                              _commandes.where((c) => c.isSelected).length,
                          locations: locations,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Flexible(
              child: _commandes.isEmpty
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'image/box.png',
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                       const  Text(
                          'No Order Today',
                          style:
                              TextStyle(fontSize: 22, color: Color(0xFFFF9800)),
                        )
                      ],
                    ))
                  : ListView.builder(
                      itemCount: _commandes.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Order ID: ${_commandes[index].trackingNumber}'),
                                Text(
                                    'Date : ${_commandes[index].commandeDate}'),
                                Text(
                                    'Name : ${_commandes[index].customerName.isEmpty ? 'Anonymous' : _commandes[index].customerName}'),
                                Text(
                                    'Adresse : ${_commandes[index].deliveryAddress.isEmpty ? 'Non fournie' : _commandes[index].deliveryAddress}'),
                              ],
                            ),
                            trailing: Checkbox(
                              value: _commandes[index].isSelected,
                              onChanged: (bool? value) {
                                setState(() {
                                  _commandes[index].isSelected = value!;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            // if (_distance.isNotEmpty)
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text(
            //       'Distance totale: $_distance',
            //       style: const TextStyle(
            //           fontSize: 16, fontWeight: FontWeight.bold),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
