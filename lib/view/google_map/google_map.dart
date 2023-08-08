import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GridViewGoogleMap extends StatefulWidget {
  const GridViewGoogleMap({super.key});

  @override
  State<GridViewGoogleMap> createState() => _GridViewGoogleMapState();
}

class _GridViewGoogleMapState extends State<GridViewGoogleMap> {
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(23.810331, 90.412521),
          zoom: 12,
        ),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
