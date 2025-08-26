import 'dart:io';
import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/top_nav.dart';
import 'package:les_vagues/widgets/dropdown_menu.dart';
import 'package:les_vagues/models/spot.dart';
import 'package:les_vagues/pages/detail_page.dart';
import 'package:les_vagues/data/mock_spots.dart';
import 'package:les_vagues/services/airtable_api.dart';

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

  List<Spot> spots = [];
  List<Spot> allSpots = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadSpots();
  }

  @override
    void dispose() {
      _controller.dispose(); // libération mémoire
      super.dispose();
  }

  Future<void> _loadSpots() async {
    try {
      final api = AirtableApi();
      final fetchedSpots = await api.fetchSpots();
      setState(() {
        allSpots = List.from(fetchedSpots);
        spots = List.from(fetchedSpots);
        isLoading = false;
        errorMessage = null;
      });
    } on SocketException {
      setState(() {
        allSpots = List.from(mockSpots);
        spots = List.from(mockSpots);
        isLoading = false;
        errorMessage = "Pas de connexion Internet - affichage des données locales";
      });
    } catch (e) {
      setState(() {
        allSpots = List.from(mockSpots);
        spots = List.from(mockSpots);
        isLoading = false;
        errorMessage = "Erreur API : $e - affichage des données locales";
      });
    }
  }

  void _applyFilter(String option) {
    setState(() {
      if (option == "Le + récent") {
        spots.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
      } else if (option == "La meilleure note") {
        spots.sort((a, b) => b.rating.compareTo(a.rating));
      } else if (option == "Par ordre alphabétique") {
        spots.sort((a, b) => a.city.compareTo(b.city)); //ou a.name si on veut par spot : à voir
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

                    if (searchQuery.isEmpty) {
                      spots = allSpots;
                    } else {
                      spots = allSpots.where((spot) {
                        return spot.name.toLowerCase().contains(
                              searchQuery.toLowerCase(),
                            ) ||
                            spot.city.toLowerCase().contains(
                              searchQuery.toLowerCase(),
                            ) ||
                            spot.country.toLowerCase().contains(
                              searchQuery.toLowerCase(),
                            );
                      }).toList();
                    }
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
                  _applyFilter(selectedFilter);
                  print("Filtre choisi : $selectedFilter");
                },
              ),
            ],
          ),

          // La grille des spots
          Expanded(
            child: spots.isEmpty
              ? const Center(
                child: Text(
                  "Aucun spot trouvé",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              children: spots.map((spot) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailSpotPage(spot: spot),
                      ),
                    );
                  },
                  child: Column(
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
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNav(
        currentIndex: 0,
        onTap: (index) {
          // navigation future
        },
        isLoggedIn: true, // change en true pour tester le cas connecté
      ),
    );
  }
}
