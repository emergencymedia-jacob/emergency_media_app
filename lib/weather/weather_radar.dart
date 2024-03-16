import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WeatherRadarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace 'YOUR_API_KEY' with your actual MapTiler API key
    String apiKey = 'wv8IGjM4JbBNl9OBfGqT';
    String radarUrl = 'https://api.maptiler.com/maps/radar/?key=$apiKey';

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Radar'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(0, 0), // Set initial map center
          zoom: 5, // Set initial zoom level
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: radarUrl,
            subdomains: ['a', 'b', 'c'],
            maxZoom: 18, // Adjust maximum zoom level if needed
          ),
        ],
      ),
    );
  }
}
