import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart'; => si on utilise Firebase

class MyBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  //simulation état de connexion
  final bool isLoggedIn;

  const MyBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.isLoggedIn = false,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFFFFF8F0),
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF2D918C),
      unselectedItemColor: Colors.black,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Rechercher'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ajouter'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}





