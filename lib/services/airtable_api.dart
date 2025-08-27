import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/spot.dart';

class AirtableApi {
  final String baseUrl = dotenv.env['AIRTABLE_BASE_URL'] ?? '';
  final String apiKey = dotenv.env['AIRTABLE_TOKEN'] ?? '';
  final String table = dotenv.env['AIRTABLE_TABLE'] ?? '';

  Future<List<Spot>> fetchSpots() async {
    final url = Uri.parse('$baseUrl/$table');

    print("URL appelée : $url");
    print("API KEY: ${apiKey.substring(0,4)}..."); // juste pour vérifier

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final records = data['records'] as List<dynamic>;

      // on mappe chaque record vers Spot
      return records
          .map((record) => Spot.fromAirtable(record as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Erreur lors du chargement des spots: ${response.body}');
    }
  }

  Future<void> createSpot(Spot spot) async {
    final url = Uri.parse('$baseUrl/$table');

    final body = jsonEncode({
      "records": [
        {
          "fields": {
            "Destination": spot.name,
            "Destination State/Country": "${spot.city}, ${spot.country}",
            "Difficulty Level": spot.difficulty, //.length,
            "Surf Break": [spot.waveType],
            "Photos": [
              {"url": spot.imageUrl}
            ],
            "Peak Surf Season Begins": "2024-06-15", // TODO à mapper
            "Peak Surf Season Ends": "2024-08-22",
            "Magic Seaweed Link": spot.mapUrl,
            "Geocode": "TODO : à mapper si besoin",
          }
        }
      ]
    });

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Spot ajouté avec succès !");
      } else {
        throw Exception("Erreur ajout spot: [${response.statusCode}] ${response.body}");
      }
  }

}

