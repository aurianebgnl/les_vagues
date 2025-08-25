import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Filtrer',
  'Le + récent',
  'La meilleure note',
  'Par ordre alphabétique',
];

class MyDropdownMenu extends StatelessWidget {
  final String initialValue;
  final Function(String?) onSelected;

  const MyDropdownMenu({
    super.key,
    required this.initialValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: initialValue,
      onSelected: onSelected, 
      dropdownMenuEntries: list
        .map((name) => DropdownMenuEntry<String>(value: name, label: name))
        .toList(),
    );
  }
  //@override
  //State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

//typedef MenuEntry = DropdownMenuEntry<String>;

//class _MyDropdownMenuState extends State<MyDropdownMenu> {
  //static final List<MenuEntry> menuEntries = List.unmodifiable(
    //list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
//  );

  //String dropdownValue = list.first;

  //@override
  //Widget build(BuildContext context) {
    //return DropdownMenu<String>(
      //initialSelection: list.first,
      //onSelected: (String? value) {
        //setState(() {
          //dropdownValue = value!;
        //});
      //},
      //dropdownMenuEntries: menuEntries,
    //);
  //}
//}
