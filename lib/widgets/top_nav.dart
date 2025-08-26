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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Les Vagues'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
