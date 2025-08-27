import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/custom_button.dart';

class CustomInputFieldLogin extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomInputFieldLogin({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext contex) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(contex).size.width * 0.06,
              bottom: 5,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(contex).size.width * 0.06,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      controller: controller,
                      obscureText: obscureText,
                      validator: validator,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 30, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputSectionLogin extends StatefulWidget {
  const InputSectionLogin({super.key});

  @override
  State<InputSectionLogin> createState() => _InputSectionLoginState();
}

class _InputSectionLoginState extends State<InputSectionLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();

  // => qd on sera rattacher à Firebase
  //FirebaseAuth auth = FirebaseAuth.instance; //Pas besoin d'ajouter cette ligne si vous l'avez déjà

  //Future loginToFirebase() async {
  //print(emailField.text.trim());
  //print(passwordField.text.trim());
  //try {
  //await auth.signInWithEmailAndPassword(
  //email: emailField.text.trim(), password: passwordField.text.trim());
  //} on FirebaseAuthException catch (e) {
  //Fluttertoast.showToast(
  //msg:
  //   "Votre adresse email ou votre mot de passe semblent être incorrects.");
  //print(e.toString());
  //}
  //}

  Future<void> fakeLogin() async {
  if (_formKey.currentState!.validate()) {
    // On simule un petit délai (comme si on attendait Firebase)
    await Future.delayed(const Duration(seconds: 1));

    // Exemple : si email contient "test" et mdp = "12345678" → succès
    if (emailField.text.trim() == "test@test.com" &&
        passwordField.text.trim() == "12345678") {
      // Succès
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Connexion réussie ✅")),
      );

      // Navigation vers HomePage (par exemple)
      Navigator.pushReplacementNamed(context, "/");
    } else {
      // Erreur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email ou mot de passe incorrect ❌")),
      );
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
            icon: Icons.mail_rounded,
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
            icon: Icons.key_rounded,
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
            child: CustomButton(
              onPressed: fakeLogin,
               text: "Valider",
            )
          ),
        ],
      ),
    );
  }
}
