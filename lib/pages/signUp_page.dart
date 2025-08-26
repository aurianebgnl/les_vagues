import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/bottom_nav.dart';
import 'package:les_vagues/widgets/form_signup.dart';
import 'package:les_vagues/widgets/top_nav.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});

  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body: Column(children: [
          Text('Bonjour, veuillez-vous enregistrer.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text('Les champs avec une * sont obligatoires.'),
          InputSection(),
        ],
      ),
      bottomNavigationBar: MyBottomNav(
        currentIndex: 0,
        onTap: (index) {
          // navigation future
        },
      ),
    );
  }
}

