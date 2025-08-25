import 'package:flutter/material.dart';

class InputSection extends StatefulWidget {
  const InputSection({super.key});

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
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
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          //EMAIL
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Adresse mail*",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(30),
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
                          child: TextField(
                            controller: emailField,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Entrez votre email",
                              hintStyle: TextStyle(
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.mail_outline_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // LOGIN
            height: MediaQuery.of(context).size.height * 0.11,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login*",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(30),
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
                          child: TextField(
                            controller: loginField,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Entrez votre login",
                              hintStyle: TextStyle(
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.mail_outline_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // NOM
            height: MediaQuery.of(context).size.height * 0.11,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nom*",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(30),
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
                          child: TextField(
                            controller: nameField,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Entrez votre nom",
                              hintStyle: TextStyle(
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.mail_outline_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // PASSWORD
            height: MediaQuery.of(context).size.height * 0.11,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mot de Passe*",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(30),
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
                          child: TextField(
                            controller: passwordField,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Entrez votre mot de passe",
                              hintStyle: TextStyle(
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.mail_outline_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.06,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(250, 250, 185, 45),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              onPressed: () {
                //signUp(); //=> qd on sera relié à FIREBASE
                print("vous êtes enregistré.e");
              },
              child: Text(
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
