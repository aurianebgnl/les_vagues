import 'package:flutter/material.dart';
import 'package:les_vagues/models/spot.dart';

class SpotHeader extends StatelessWidget {
  const SpotHeader({super.key, required this.spot});

  final Spot spot;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Image.network(spot.imageUrl, fit: BoxFit.cover),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${spot.city}, ${spot.country}",
                      //style: Theme.of(context).textTheme.subtitle1
                      ),
                  Text(spot.name,
                      //style: Theme.of(context).textTheme.headline6
                      ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Text("⭐ ${spot.rating.toString()}",
                      //style: Theme.of(context).textTheme.subtitle1

                      //),
                  //Text("${spot.dateAdded.toLocal()}",
                      //style: Theme.of(context).textTheme.caption
                     // ),

                      //),
                  Text(
                    "${spot.dateAdded.day.toString().padLeft(2, '0')}-"
                    "${spot.dateAdded.month.toString().padLeft(2, '0')}-"
                    "${spot.dateAdded.year}",
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}