import 'package:flutter/material.dart';
import 'package:les_vagues/models/spot.dart';

class SpotDetails extends StatelessWidget {
  const SpotDetails({super.key, required this.spot});

  final Spot spot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Difficulté :"),
              Text("Type de vague :"),
              Text("Saison :"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(spot.difficulty),
              Text(spot.waveType),
              Text(spot.season),
            ],
          ),
        ],
      ),
    );
  }
}
