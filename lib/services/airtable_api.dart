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
}
