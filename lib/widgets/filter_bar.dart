import 'package:flutter/material.dart';
import 'package:les_vagues/widgets/dropdown_menu.dart';

class FilterBar extends StatelessWidget {
  final String selectedFilter;
  final Function(String?) onChanged;

  const FilterBar({super.key, required this.selectedFilter, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Affichage : $selectedFilter'),
        const Spacer(),
        MyDropdownMenu(initialValue: selectedFilter, onSelected: onChanged),
      ],
    );
  }
}