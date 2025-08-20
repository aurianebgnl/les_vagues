import 'package:flutter/material.dart';

class MyTopNav extends StatelessWidget implements PreferredSizeWidget {

  const MyTopNav({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('Les Vagues'),
    );
    //throw UnimplementedError();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}