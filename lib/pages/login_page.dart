import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/form_login.dart';
import 'package:les_vagues/widgets/top_nav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body: Column(children: [
        Text('Bonjour, veuillez- vous enregistrer.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text('Les champs avec une * sont obligatoires.'),
        InputSectionLogin(),

        //champs email & password
      ],
      ),
      bottomNavigationBar: MyBottomNav(
        currentIndex: 0, 
        onTap: (index){},
        isLoggedIn: true, // change en true pour tester le cas connecté
      ),
    );
  }

}