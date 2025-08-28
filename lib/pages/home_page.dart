import 'dart:io';
import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/filter_bar.dart';
import 'package:les_vagues/widgets/top_nav.dart';
import 'package:les_vagues/widgets/dropdown_menu.dart';
import 'package:les_vagues/widgets/search_bar.dart';
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
  final TextEditingController _controller = TextEditingController();

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
        errorMessage =
            "Pas de connexion Internet - affichage des données locales";
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
      } else if (option == "Le plus difficile") {
        spots.sort((a, b) => b.difficulty.compareTo(a.difficulty));
      } else if (option == "Par ordre alphabétique") {
        spots.sort(
          (a, b) => a.city.compareTo(b.city),
        ); //ou a.name si on veut par spot : à voir
      }
    });
  }

  void _applySearch(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        spots = allSpots;
      } else {
        spots = allSpots.where((spot) {
          return spot.name.toLowerCase().contains(query.toLowerCase()) ||
              spot.city.toLowerCase().contains(query.toLowerCase()) ||
              spot.country.toLowerCase().contains(query.toLowerCase());
        }).toList();
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
          MySearchBar(controller: _controller, onSearch: _applySearch),
          FilterBar(
            selectedFilter: selectedFilter,
            onChanged: (value) {
              setState(() => selectedFilter = value ?? "Filtrer");
              _applyFilter(selectedFilter);
            },
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : spots.isEmpty
                ? const Center(child: Text("Aucun spot trouvé"))
                : SpotsGrid(spots: spots),
          ),
        ],
      ),
    );
  }
}

class SpotsGrid extends StatelessWidget {
  final List<Spot> spots;

  const SpotsGrid({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
    );
  }
}
