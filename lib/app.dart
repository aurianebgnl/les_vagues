//MaterialApp, thèmes, routes globales

import 'package:flutter/material.dart';
import 'package:les_vagues/pages/ajout_page.dart';
import 'package:les_vagues/pages/login_page.dart';
import 'package:les_vagues/pages/profile_page.dart';
import 'pages/home_page.dart';
//import 'pages/ajout_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Les Vagues',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D918C)),
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
