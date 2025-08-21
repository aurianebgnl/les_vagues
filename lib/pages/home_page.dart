import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/top_nav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body : Container(
        child : Row(
          children: [
            Column(
              children: [
                Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
                fit: BoxFit.cover,
                ),
                Text('Ville, Pays'), Text('Nom du spot')
              ]
              ),
            Column(
              children: [
                Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
                fit: BoxFit.cover,
                ),
                Text('Ville, Pays'), Text('Nom du spot')
              ]
              ),  
        ]),
        //const SizedBox(height: 16),

      ),
      bottomNavigationBar: MyBottomNav(currentIndex: 0, onTap: (index) {}),
    );
  }
}
