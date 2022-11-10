import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';

import '../models/character.dart';

class MarvelService {
  static const apiUrl = 'http://gateway.marvel.com/v1/public';
  static const apiKey = '3e6e495605ad9c49c059b5010b6d23d1';
  static const apiHash = '575db3a7e12a2b7c6fc24ffc97ffa5d1';

  static Future<List<MarvelListItem>> getCharacters() async {
    final query = Uri(queryParameters: {
      'hash': MarvelService.apiHash,
      'apikey': MarvelService.apiKey,
      'ts': '1000',
    }).query;

    final url = Uri.parse('${MarvelService.apiUrl}/characters?$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return data['data']['results'].map<MarvelListItem>((character) {
        return Character.fromMap(character);
      }).toList();
    }

    return [];
  }
}
