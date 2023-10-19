import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'api.dart';
import 'package:http/http.dart' as http;

class ProblemMap extends StatefulWidget {
  const ProblemMap({super.key});

  @override
  _ProblemMapState createState() => _ProblemMapState();
}

class _ProblemMapState extends State<ProblemMap> {
  // GoogleMapController? _controller;

  // final Set<Marker> allMarkers = Set<Marker>.from([
  //   Marker(
  //     markerId: MarkerId('1'),
  //     position: LatLng(37.7749, -122.4194), // Replace with actual coordinates
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     infoWindow: InfoWindow(title: 'Water Issue'),
  //   ),
  //   Marker(
  //     markerId: MarkerId('2'),
  //     position: LatLng(37.7749, -122.4194), // Replace with actual coordinates
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //     infoWindow: InfoWindow(title: 'Electricity Issue'),
  //   ),
  //   // Add more markers for other issues with different colors
  // ]);

  // Raw coordinates got from  OpenRouteService
  List listOfPoints = [];

  // Conversion of listOfPoints into LatLng(Latitude, Longitude) list of points
  List<LatLng> points = [];

  // Method to consume the OpenRouteService API
  getCoordinates() async {
    // Requesting for openrouteservice api
    var response = await http.get(getRouteUrl(
        "1.243344,6.145332", '1.2160116523406839,6.125231015668568'));
    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listOfPoints = data['features'][0]['geometry']['coordinates'];
        points = listOfPoints
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500, // Set the desired height
      width: 700, // Set the desired width
      // child: GoogleMap(
      //   onMapCreated: (controller) {
      //     setState(() {
      //       _controller = controller;
      //     });
      //   },
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(37.7749, -122.4194), // Initial map coordinates
      //     zoom: 12.0,
      //   ),
      //   markers: allMarkers,
      // ),
      child: FlutterMap(
        options: const MapOptions(
            initialZoom: 13, initialCenter: LatLng(6.131015, 1.223898)),
        children: [
          // Layer that adds the map
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            // Plenty of other options available!
          ),
          // Layer that adds points the map
          MarkerLayer(
            markers: [
              // First Marker
              Marker(
                point: const LatLng(6.145332, 1.243344),
                width: 80,
                height: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.water_drop),
                  color: Colors.blue,
                  iconSize: 45,
                ),
              ),
              // Second Marker
              Marker(
                point: const LatLng(6.125231015668568, 1.2160116523406839),
                width: 80,
                height: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_road),
                  color: Colors.black,
                  iconSize: 45,
                ),
              ),
            ],
          ),

          // Polylines layer
          PolylineLayer(
            polylineCulling: false,
            polylines: [
              Polyline(points: points, color: Colors.black, strokeWidth: 5),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Problem Map Example'),
      ),
      body: const ProblemMap(),
    ),
  ));
}
