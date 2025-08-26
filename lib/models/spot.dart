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

  /// Convertir un record Airtable en Spot
  factory Spot.fromAirtable(Map<String, dynamic> record) {
    final fields = (record['fields'] as Map<String, dynamic>? ?? {});

    return Spot(
      name: fields['Destination'] ?? 'Sans nom',
      city: _extractCity(fields['Address']),
      country: _extractCountry(fields['Destination State/Country']),
      imageUrl: (fields['Photos'] != null && fields['Photos'].isNotEmpty)
          ? fields['Photos'][0]['url']
          : '',
      rating: fields['Difficulty Level'] ?? 0,
      dateAdded: DateTime.tryParse(record['createdTime'] ?? '') ??
          DateTime.now(),
      difficulty: fields['Difficulty Level']?.toString() ?? '',
      waveType: (fields['Surf Break'] != null && fields['Surf Break'].isNotEmpty)
          ? fields['Surf Break'][0]
          : '',
      season:
          "${fields['Peak Surf Season Begins'] ?? '?'} - ${fields['Peak Surf Season Ends'] ?? '?'}",
      mapUrl: fields['Magic Seaweed Link'] ?? '',
    );
  }

  // Helpers simples pour découper ville/pays
  static String _extractCity(String? address) {
    if (address == null) return '';
    final parts = address.split(',');
    return parts.isNotEmpty ? parts.first.trim() : '';
  }

  static String _extractCountry(String? stateCountry) {
    if (stateCountry == null) return '';
    final parts = stateCountry.split(',');
    return parts.length > 1 ? parts.last.trim() : stateCountry;
  }
}
