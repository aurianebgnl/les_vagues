import 'package:flutter/material.dart';

class Spot {
  final String name;
  final String city;
  final String country;
  final String imageUrl;
  final int rating; // tu peux mettre double si tu veux gérer des notes
  final DateTime dateAdded;
  final String difficulty;
  final String waveType;
  final String season;
  final String mapUrl;

  const Spot({
    required this.name,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.rating,
    required this.dateAdded,
    required this.difficulty,
    required this.waveType,
    required this.season,
    required this.mapUrl,
  });
}