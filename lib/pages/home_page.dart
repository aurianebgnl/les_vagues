import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/top_nav.dart';
import 'package:les_vagues/widgets/dropdown_menu.dart';
import 'package:les_vagues/models/spot.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchQuery = "";
  String selectedFilter = "Filtrer";
  TextEditingController _controller = TextEditingController();

  List<Spot> spots = [
  Spot(name: "La Nord", city: "Hossegor", country: "France", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg", rating: 5, dateAdded: DateTime(2024, 8, 1), difficulty: "****", waveType: "Beach Break", season: "Juin", mapUrl: "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg"),
  Spot(name: "Grande Plage", city: "Biarritz", country: "France", imageUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Biarritz%20-%20c%C3%B4te%20des%20Basques.jpg", rating: 4, dateAdded: DateTime(2024, 8, 1), difficulty: "***", waveType: "Beach Break", season: "Mars", mapUrl: " https://commons.wikimedia.org/wiki/Special:FilePath/Biarritz%20-%20c%C3%B4te%20des%20Basques.jpg"),
  Spot(name: "Pointe Parlementia", city: "Guéthary", country: "France", imageUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Lacanau%20oc%C3%A9an%20surfeurs%20(2).jpg", rating: 4, dateAdded: DateTime(2024, 8, 1), difficulty: "****", waveType: "Beach Break", season: "Juin", mapUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Pointe_Parlementia_2019_Bas_PL3.jpg"),
  Spot(name: "La Plage Super Sud", city: "Lacanau", country: "France", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg", rating: 5, dateAdded: DateTime(2024, 8, 1), difficulty: "****", waveType: "Beach Break", season: "Avril", mapUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Lacanau%20oc%C3%A9an%20surfeurs%20(2).jpg"),
  Spot(name: "Les Cavaliers", city: "Anglet", country: "France", imageUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Anglet-cavaliers-beach-2014.jpg", rating: 4, dateAdded: DateTime(2024, 8, 1), difficulty: "****", waveType: "Beach Break", season: "Juin", mapUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Anglet-cavaliers-beach-2014.jpg"),
  Spot(name: "Plage du Santocha", city: "Capbreton", country: "France", imageUrl: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/79/f0/30/plage-du-santocha.jpg?w=1200&h=1200&s=1", rating: 3, dateAdded: DateTime(2024, 8, 1), difficulty: "**", waveType: "Beach Break", season: "Juin", mapUrl: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/79/f0/30/plage-du-santocha.jpg?w=1200&h=1200&s=1"),
  Spot(name: "Plage de la Torche", city: "La Torche", country: "France", imageUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Plage_de_la_Torche.jpg", rating: 5, dateAdded: DateTime(2024, 8, 1), difficulty: "***", waveType: "Beach Break", season: "Juin", mapUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Plage_de_la_Torche.jpg"),
  Spot(name: "Port Bara", city: "Quiberon", country: "France", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/9/95/Quiberon_Surf.jpg", rating: 5, dateAdded: DateTime(2024, 8, 1), difficulty: "****", waveType: "Beach Break", season: "Septembre", mapUrl: "https://upload.wikimedia.org/wikipedia/commons/9/95/Quiberon_Surf.jpg"),
  Spot(name: "Saint Barbe", city: "Hossegor", country: "France", imageUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Lafitenia%20Bay%20(25951790728).jpg", rating: 3, dateAdded: DateTime(2024, 8, 1), difficulty: "***", waveType: "Beach Break", season: "Juin", mapUrl: "https://commons.wikimedia.org/wiki/Special:FilePath/Lafitenia%20Bay%20(25951790728).jpg"),
  Spot(name: "Plage des Carernes", city: "Seignosse", country: "France", imageUrl: "https://www.seignosse-surf-school.com/wp-content/uploads/2020/05/seignosse_surf_school_ecole_de_surf_LA_NORD-800x534.jpg", rating: 5, dateAdded: DateTime(2024, 8, 1), difficulty: "***", waveType: "Beach Break", season: "Juin", mapUrl: "https://www.seignosse-surf-school.com/wp-content/uploads/2020/05/seignosse_surf_school_ecole_de_surf_LA_NORD-800x534.jpg"),
];

void _applyFilter(String option) {
    setState(() {
      if (option == "Le + récent") {
        spots.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
      } else if (option == "La meilleure note") {
        spots.sort((a, b) => b.rating.compareTo(a.rating));
      } else if (option == "Par ordre alphabétique") {
        spots.sort((a, b) => a.city.compareTo(b.city));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body: Column(
        children: [
          // Barre de recherche
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Rechercher...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    searchQuery = _controller.text;
                  });
                  print("Recherche : $searchQuery");
                },
              ),
            ],
          ),

          // Filtrage
          Row(
            children: [
              Text('Affichage : $selectedFilter'),
              const Spacer(),
              MyDropdownMenu(
                initialValue: selectedFilter,
                onSelected: (value) {
                  setState(() {
                    selectedFilter = value ?? "Filtrer";
                  });
                  _applyFilter(selectedFilter); // 👉 applique le filtre
                  print("Filtre choisi : $selectedFilter");
                },
              ),
            ],
          ),

          // La grille
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              children: spots.map((spot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      spot.imageUrl,
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${spot.city}, ${spot.country}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(spot.name),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNav(currentIndex: 0, onTap: (index) {}),
    );
  }
}