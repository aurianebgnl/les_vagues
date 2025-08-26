import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class _InputSectionLoginState extends State<InputSectionLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginToFirebase() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: emailField.text.trim(),
          password: passwordField.text.trim(),
        );

        // Connexion réussie
        Fluttertoast.showToast(msg: "Connexion réussie ✅");
        // Ici tu pourrais rediriger vers ta page d'accueil
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));

      } on FirebaseAuthException catch (e) {
        String message = "Erreur inconnue";

        if (e.code == 'user-not-found') {
          message = "Aucun compte trouvé avec cet email.";
        } else if (e.code == 'wrong-password') {
          message = "Mot de passe incorrect.";
        }

        Fluttertoast.showToast(msg: message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInputFieldLogin(
            controller: emailField,
            label: "Adresse mail*",
            hintText: "Entrez votre email",
            icon: Icons.mail_lock_rounded,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "L'email est obligatoire";
              }
              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                return "Entrez un email valide";
              }
              return null;
            },
          ),
          CustomInputFieldLogin(
            controller: passwordField,
            label: "Mot de passe*",
            hintText: "Entrez votre mot de passe",
            icon: Icons.key_off_rounded,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Le mot de passe est obligatoire";
              }
              if (value.length < 8) {
                return "Minimum 8 caractères";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.06,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onPressed: loginToFirebase, // ✅ active le bouton
              child: const Text(
                "Valider",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}