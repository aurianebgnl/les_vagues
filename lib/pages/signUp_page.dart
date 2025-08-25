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

