import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.11,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Container(
            //margin: const EdgeInsets.only(bottom: 5),
             margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.06, 
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
            //height: MediaQuery.of(context).size.height * 0.06,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
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

class InputSection extends StatefulWidget {
  const InputSection({super.key});

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailField = TextEditingController();
  final TextEditingController loginField = TextEditingController();
  final TextEditingController nameField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();

  //Future signUp() async {
  // à rattacher à Firebase
  //await auth.instance.createUserWithEmailAndPassword(
  //email: emailField.text.trim(),
  //password: passwordField.text.trim(),
  //);
  //var userID = auth.currentUser!.uid;
  //addUser(userID, userName.text, emailField.text);
  //}

  @override
  void dispose() {
    emailField.dispose();
    loginField.dispose();
    nameField.dispose();
    passwordField.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      //si tt est valide -> enregistrement dans Firebase
      print("Formulaire valide -> Enregistrement...");
    } else {
      print("Formulaire invalide !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInputField(
            controller: emailField,
            label: "Adresse mail*",
            hintText: "Entrez votre email",
            icon: Icons.mail_rounded,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "L'email est obligatoire";
              }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                return "Entrez un email valide";
              }
              return null;
            },
          ),
          CustomInputField(
            controller: loginField,
            label: "Login*",
            hintText: "Entrez votre login",
            icon: Icons.person_rounded,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Le login est obligatoire";
              }
              return null;
            },
          ),
          CustomInputField(
            controller: nameField,
            label: "Nom*",
            hintText: "Entrez votre nom",
            icon: Icons.person_rounded,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Le nom est obligatoire";
              }
              return null;
            },
          ),
          CustomInputField(
            controller: passwordField,
            label: "Mot de passe*",
            hintText: "Entrez votre mot de passe (8 caractères minimum)",
            icon: Icons.key_rounded,
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
              onPressed: _signUp,

              child: const Text(
                "S'enregistrer",
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
