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
        /* Image.network(
          spot.mapUrl ?? "https://via.placeholder.com/400x200?text=Pas+de+carte",
          fit: BoxFit.cover), */
      ],
    );
  }
}
