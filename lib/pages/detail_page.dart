import 'package:flutter/material.dart';
import 'package:les_vagues/models/spot.dart';
import 'package:les_vagues/widgets/spot_header.dart';
import 'package:les_vagues/widgets/spot_map.dart';
import 'package:les_vagues/widgets/top_nav.dart';
import 'package:les_vagues/widgets/spot_details.dart';

class DetailSpotPage extends StatelessWidget {
  const DetailSpotPage({super.key, required this.spot});

  final Spot spot;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpotHeader(spot: spot),
            const SizedBox(height: 16),
            SpotDetails(spot: spot),
            const SizedBox(height: 16),
            SpotMap(spot: spot),
          ],
        ),
      ),
    );
  }
}
