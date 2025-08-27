
class Spot {
  final String name;
  final String city;
  final String country;
  final String imageUrl;
  final int rating; 
  final DateTime dateAdded;
  final String difficulty;
  final String waveType;
  final DateTime peakSeasonStart;
  final DateTime peakSeasonEnd;
  final String? mapUrl;

  const Spot({
    required this.name,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.rating,
    required this.dateAdded,
    required this.difficulty,
    required this.waveType,
    required this.peakSeasonStart,
    required this.peakSeasonEnd,
    this.mapUrl,
  });

  /// Convertir un record Airtable en Spot
  factory Spot.fromAirtable(Map<String, dynamic> record) {
    final fields = (record['fields'] as Map<String, dynamic>? ?? {});
    
    final startRaw = fields['Peak Surf Season Begins'];
    final endRaw   = fields['Peak Surf Season Ends'];

    final startDate = startRaw != null ? DateTime.tryParse(startRaw) : null;
    final endDate   = endRaw != null ? DateTime.tryParse(endRaw) : null;

    if (startDate == null || endDate == null) {
      throw Exception("Les champs Peak Surf Season Begins/Ends sont requis mais absents dans Airtable.");
    }

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
      peakSeasonStart: startDate,
      peakSeasonEnd: endDate,
      mapUrl: fields['Magic Seaweed Link'] ?? '',
    );
  }

  // Getter pour l’affichage du range saison
  String get seasonLabel {
    final startMonth = _monthName(peakSeasonStart.month);
    final endMonth = _monthName(peakSeasonEnd.month);
    return "$startMonth - $endMonth";
  }

  static String _monthName(int month) {
    const months = [
      "Janvier",
      "Février",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Août",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre"
    ];
    return months[month - 1];
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
