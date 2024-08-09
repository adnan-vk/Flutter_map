import 'dart:developer';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapPage({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    log("map page lat : ${widget.latitude.runtimeType}");
    log("map page lng : ${widget.longitude.runtimeType}");
    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: LatLng(widget.latitude, widget.longitude),
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
            maxNativeZoom: 19,
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(
                  Uri.parse('https://openstreetmap.org/copyright'),
                ),
              ),
            ],
          ),
          MarkerLayer(markers: [
            Marker(
              point: LatLng(widget.latitude, widget.longitude),
              child: Icon(
                EneftyIcons.location_bold,
                color: Colors.red,
              ),
            )
          ])
        ],
      ),
    );
  }
}
