import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/top_nav.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          Text("Vous pouvez maintenant ajouter un spot !"),
        ],
      ),
      
    );
  }
}
