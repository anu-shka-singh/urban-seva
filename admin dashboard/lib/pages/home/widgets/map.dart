import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProblemMap extends StatefulWidget {
  @override
  _ProblemMapState createState() => _ProblemMapState();
}

class _ProblemMapState extends State<ProblemMap> {
  GoogleMapController? _controller;

  final Set<Marker> allMarkers = Set<Marker>.from([
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.7749, -122.4194), // Replace with actual coordinates
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: 'Water Issue'),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(37.7749, -122.4194), // Replace with actual coordinates
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: 'Electricity Issue'),
    ),
    // Add more markers for other issues with different colors
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, // Set the desired height
      width: 700,  // Set the desired width
      child: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Initial map coordinates
          zoom: 12.0,
        ),
        markers: allMarkers,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Problem Map Example'),
      ),
      body: ProblemMap(),
    ),
  ));
}
