import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Filtrer',
  'Le + récent',
  'La meilleure note',
  'Par ordre alphabétique'
];

class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({super.key});

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  static final List<MenuEntry> menuEntries = List.unmodifiable(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }
}