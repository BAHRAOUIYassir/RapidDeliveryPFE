import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TargetMaps extends StatefulWidget {
  final String distance;
  final int nbrorder;
  final List<Location> locations;

  const TargetMaps({
    super.key,
    required this.distance,
    required this.nbrorder,
    required this.locations,
  });

  @override
  _TargetMapsState createState() => _TargetMapsState();
}

class _TargetMapsState extends State<TargetMaps> {
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(33.856329, -5.537661),
    zoom: 13,
  );

  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = [];
  final List<LatLng> _polylineCoordinates = [];
  Polyline _polyline = Polyline(
    polylineId: PolylineId('route'),
    color: Colors.blue,
    width: 5,
  );

  @override
  void initState() {
    super.initState();
    _setMarkersAndPolyline();
  }

  void _setMarkersAndPolyline() {
    List<LatLng> latLngList = [];
    for (var location in widget.locations) {
      LatLng latLng = LatLng(location.latitude, location.longitude);
      _markers.add(
        Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
          infoWindow: InfoWindow(title: 'Order Location'),
        ),
      );
      latLngList.add(latLng);
    }

    setState(() {
      _polylineCoordinates.addAll(latLngList);
      _polyline = Polyline(
        polylineId: PolylineId('route'),
        color: Colors.blue,
        points: _polylineCoordinates,
        width: 5,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Target maps'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            mapType: MapType.terrain,
            markers: Set<Marker>.of(_markers),
            polylines: Set<Polyline>.of([_polyline]),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.1,
            maxChildSize: 0.2,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Order Number: ${widget.nbrorder}'),
                      const SizedBox(height: 20),
                      Text("Distance traveled: ${widget.distance}"),
                      const SizedBox(height: 20),
                      const Text("Estimated time:"),//hna atkon temps t9diri 
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
