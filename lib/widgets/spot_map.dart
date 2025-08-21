import 'package:flutter/material.dart';
import 'package:les_vagues/models/spot.dart';

class SpotMap extends StatelessWidget {
  const SpotMap({super.key, required this.spot});

  final Spot spot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Géolocalisation"),
        Image.network(spot.mapUrl, fit: BoxFit.cover),
      ],
    );
  }
}
