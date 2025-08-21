import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/top_nav.dart';
import 'package:les_vagues/widgets/dropdown_menu.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchQuery = "";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body: Column(
        children: [
          // Barre de recherche avec bouton
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
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    searchQuery = _controller.text;
                  });
                  print("Recherche : $searchQuery");
                },
              ),
            ],
          ),
          Row(children: [
            MyDropdownMenu()],),
          // La grille
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              children: List.generate(10, (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ville, Pays',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text('Nom du spot'),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNav(currentIndex: 0, onTap: (index) {}),
    );
  }
}