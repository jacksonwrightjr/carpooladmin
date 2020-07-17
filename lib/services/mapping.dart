import 'dart:convert';

import 'package:carpooladmin/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'database.dart';
import 'dart:async';

class StaticMap extends StatefulWidget {
  @override
  _StaticMapState createState() => _StaticMapState();
}

class _StaticMapState extends State<StaticMap> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.3, -122.45),
    zoom: 13.6
    );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.9,
    target: LatLng(23, 59),
    tilt: 25.7,
    zoom: 12.55
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          compassEnabled: true,
          initialCameraPosition: CameraPosition(target: LatLng(0,0)),

          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}