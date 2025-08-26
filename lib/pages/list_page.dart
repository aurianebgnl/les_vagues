import 'dart:io';
import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/top_nav.dart';
import 'package:les_vagues/widgets/dropdown_menu.dart';
import 'package:les_vagues/models/spot.dart';
import 'package:les_vagues/pages/detail_page.dart';
import '../services/airtable_api.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key, required this.title});

  final String title;

  @override 
  State<MyListPage> createState () => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  // String searchQuery = "";
  // String selectedFilter = "Filter";
  // TextEditingController _controller = TextEditingController();

  List<Spot> spots = [];
  bool isLoading = true; // indicateur de chargement
  String? errorMessage; 

  @override
  void initState() {
    super.initState();
    _loadSpots();
  }

  Future<void> _loadSpots() async {
    try {
      final api = AirtableApi();
      final fetchedSpots = await api.fetchSpots();
      setState(() {
        spots = fetchedSpots;
        isLoading = false;
        errorMessage = null;
      });
    } on SocketException {
      setState(() {
        isLoading = false;
        errorMessage = "Pas de connexion Internet";
      });
    } catch (e){
      print("Erreur lors du chargement des spots : $e");
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  // void _applyFilter(String option){
  //   setState(() {
  //     if (option == "Le + récent") {
  //       spots.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
  //     } else if (option == "La meilleure note") {
  //       spots.sort((a, b) => a.city.compareTo(b.city));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center( 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        errorMessage!.contains("Internet")
                            ? Icons.wifi_off
                            : Icons.error,
                        color: Colors.red,
                        size: 50,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        errorMessage!,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        errorMessage!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                            errorMessage = null;
                          });
                          _loadSpots();
                        },
                        child: const Text("Réessayer"),
                      ),
                    ],
                  ),
                )
          : ListView.builder(
              itemCount: spots.length,
              itemBuilder: (context, index) {
                final spot = spots[index];
                return ListTile(
                  leading: spot.imageUrl.isNotEmpty
                      ? Image.network(
                          spot.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.beach_access),
                  title: Text(spot.name),
                  subtitle: Text('${spot.city}, ${spot.country}'),
                );
              },
            ),
      bottomNavigationBar: MyBottomNav(
        currentIndex: 0,
        onTap: (index) {
          // navigation future
        },
    ));
  }
}