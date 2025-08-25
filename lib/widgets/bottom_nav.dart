import 'package:flutter/material.dart';

class MyBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        // tu déclenches ton callback pour mettre à jour l’état
        onTap(index);

        // et tu peux aussi gérer la navigation ici
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/search');
            break;
          case 2:
            Navigator.pushNamed(context, '/add');
            break;
          case 3:
            Navigator.pushNamed(context, '/signUp');
            break;
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Rechercher'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ajouter'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}
