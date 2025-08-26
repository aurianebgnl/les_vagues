//MaterialApp, thèmes, routes globales

import 'package:flutter/material.dart';
import 'package:les_vagues/models/spot.dart';
import 'package:les_vagues/pages/ajout_page.dart';
import 'package:les_vagues/pages/login_page.dart';
import 'package:les_vagues/pages/profile_page.dart';
import 'pages/home_page.dart';
import 'pages/signup_page.dart';
import 'pages/list_page.dart';
//import 'pages/ajout_page.dart';

//TEMPORAIRE, avant de connecter à API ou BDD
Spot hossegor = Spot(
  name: "Hossegor",
  city: "Hossegor",
  country: "France",
  imageUrl: "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
  rating: 5,
  //rating: "★★★★☆ (123 votes)",
  dateAdded: DateTime(2024, 8, 1),
  //dateAdded: "12/08/2023",
  difficulty: "Intermédiaire",
  waveType: "Reef Break",
  season: "Juin - Septembre",
  mapUrl: "https://upload.wikimedia.org/wikipedia/commons/0/0a/Surf_at_Hossegor.jpg",
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Les Vagues',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),

      initialRoute: '/', // Page de démarrage
      routes: {
        // '/': (context) => MyHomePage(title: 'Les Vagues'),
        '/': (context) => MyHomePage(title: 'Les Vagues'),
        //'/detailspot/id': (context) => DetailSpotPage(spot: hossegor), => ne s'ecrit pas ici
        '/login': (context) => LoginPage(title: 'Les Vagues'),
        //'/signUp': (context) => SignupPage(title: 'Les Vagues'),
        '/add': (context) => AjoutSpotPage(),
        //'/search' : (context) => RecherchePage(title: 'Les Vagues'),
        '/profile' : (context) => ProfilePage(title: 'Les Vagues'),
      },
    );
  }
}
