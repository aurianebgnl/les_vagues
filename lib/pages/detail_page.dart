import 'package:flutter/material.dart';
import 'package:les_vagues/models/spot.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
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
            Image.network(spot.imageUrl),
            Text("${spot.city}, ${spot.country}"),
            Text("Note : ${spot.rating} /5"),
            Text("Ajouté le : ${spot.dateAdded.toLocal()}".split(' ')[0]),
            //SpotHeader(spot: spot),
            //const SizedBox(height: 16),
            //SpotDetails(spot: spot),
            //const SizedBox(height: 16),
            //SpotMap(spot: spot),
          ],
        ),
      ),
      /* body: Container(
        child: Column(
          children: [
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [Text('Ville, Pays'), Text('Nom du spot')],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('Note (nb votes)'),
                    Text('Date ajout spot'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Difficulté : '),
                    Text('Type de vague :'),
                    Text('Saison'),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('*****'),
                    Text('Reef Break'),
                    Text('Juin'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text('Géolocalisation'),
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ), */
      bottomNavigationBar: MyBottomNav(
        currentIndex: 0,
        onTap: (index) {
          // navigation future
        },
    ));
  }
}
