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
      // showSelectedLabels: true,
      // showUnselectedLabels: true,
      // onTap: (index) {
      //   // tu déclenches ton callback pour mettre à jour l’état
      //   onTap(index);

      //   // et tu peux aussi gérer la navigation ici
      //   switch (index) {
      //     case 0:
      //       Navigator.pushNamed(context, '/');
      //       break;
      //     case 1:
      //       Navigator.pushNamed(context, '/search');
      //       break;
      //     case 2:
      //       Navigator.pushNamed(context, '/add');
      //       break;
      //     case 3: //sans firebase
      //       //if (isLoggedIn) {
      //         //Navigator.pushNamed(context, '/profile');
      //       //}else{
      //         Navigator.pushNamed(context, '/auth');
      //         //Navigator.pushNamed(context, '/signUp');
      //       //}
      //       break;
      //     //case 3: => avec firebase
      //       //final user = FirebaseAuth.instance.currentUser;
      //       //if (user != null) {
      //         //Navigator.pushNamed(context, '/profile');
      //       //} else {
      //         //Navigator.pushNamed(context, '/login');
      //       //}
      //       //break;
      //     }
      //   },
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





