import 'package:flutter/material.dart';

class CustomFieldContainer extends StatelessWidget {
  final String label;
  final Widget child;
  final IconData icon;

  const CustomFieldContainer({
    super.key,
    required this.label,
    required this.child,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          // Label
          Container(
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

          // Box stylisée
          Container(
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
                // Le champ (TextFormField, Dropdown…)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: child,
                  ),
                ),
                // Icône
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
