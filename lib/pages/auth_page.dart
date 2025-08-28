import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/top_nav.dart';
import 'package:les_vagues/widgets/form_login.dart';
import 'package:les_vagues/widgets/form_signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key, required this.title});

  final String title;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true; // true = login, false = signup

  void toggleForm() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopNav(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isLogin ? 'Bienvenue, veuillez-vous connecter.' : 'Bonjour, veuillez-vous enregistrer.',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('Les champs avec une * sont obligatoires.'),
            const SizedBox(height: 20),
            // Affiche le formulaire correspondant
            isLogin ? InputSectionLogin() : InputSection(),
            const SizedBox(height: 20),
            // Bouton pour basculer entre login et signup
            TextButton(
              onPressed: toggleForm,
              child: Text(
                isLogin
                    ? "Pas encore inscrit ? Créez un compte"
                    : "Déjà inscrit ? Connectez-vous",
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
