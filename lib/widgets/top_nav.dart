//import 'package:flutter/material.dart'; 
//class MyTopNav extends StatelessWidget implements PreferredSizeWidget { 
  //const MyTopNav({super.key}); 
  
  //@override Widget build(BuildContext context) { 
    //return AppBar( 
      //backgroundColor: Theme.of(context).colorScheme.inversePrimary, 
      //title: Text('Les Vagues'), 
    //);  
  //} 
  
  //@override 
  //Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
  
  //}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTopNav extends StatelessWidget implements PreferredSizeWidget {
  const MyTopNav({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/");
      },
      child: AppBar(
        automaticallyImplyLeading: false, // => enlève la flèche par défaut
        backgroundColor: const Color(0xFFFFF8F0),
        title: Text(
          'Les Vagues',
          style: GoogleFonts.manrope(
            color: const Color(0xFF2D918C), 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
