import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/top_nav.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.title});

  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body: Column(
        children: [
          Text(
            "Bienvenue!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text("bientôt il y aura une page fonctionnelle ;)"),
        ],
      ),
      //bottomNavigationBar: MyBottomNav(currentIndex: 0, onTap: (index) {}),
    );
  }
}
