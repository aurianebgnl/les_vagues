//MaterialApp, thèmes, routes globales

import 'package:flutter/material.dart';
import 'pages/detail_page.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),

      initialRoute: '/', // Page de démarrage
      routes: {
        '/': (context) => MyHomePage(title: 'Les Vagues'),
        '/detailspot/id': (context) => DetailSpotPage(title: 'Les Vagues'),
        //'/add': (context) => AjoutSpot(title: 'Les Vagues'),
        //'/search' : (context) => RecherchePage(title: 'Les Vagues'),
        //'/profile' : (context) => ProfilPage(title: 'Les Vagues'),
      },
    );
  }
}
