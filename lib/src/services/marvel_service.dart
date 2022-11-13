import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/character.dart';
import 'package:ucp_flutter_demo_app/src/models/comic.dart';
import 'package:ucp_flutter_demo_app/src/models/event.dart';
import 'package:ucp_flutter_demo_app/src/models/serie.dart';
import 'package:ucp_flutter_demo_app/src/models/home_screen_data.dart';
import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';

class MarvelService {
  static const apiUrl = 'http://gateway.marvel.com/v1/public';
  static const apiKey = '3e6e495605ad9c49c059b5010b6d23d1';
  static const apiHash = '575db3a7e12a2b7c6fc24ffc97ffa5d1';

  static String buildApiParameters() {
    return Uri(queryParameters: {
      'hash': MarvelService.apiHash,
      'apikey': MarvelService.apiKey,
      'ts': '1000',
    }).query;
  }

  static Future<MarvelListsData> getMarvelData([
    int? id,
    String? type,
  ]) async {
    emptyFuture() async => <MarvelListItem>[];
    final data = await Future.wait([
      type == 'characters'
          ? emptyFuture() // Devolver un array vacío en caso de que se quiera filtrar por "personajes"
          : getCharacters(id, type),
      type == 'series'
          ? emptyFuture() // Devolver un array vacío en caso de que se quiera filtrar por "series"
          : getSeries(id, type),
      type == 'comics'
          ? emptyFuture() // Devolver un array vacío en caso de que se quiera filtrar por "comics"
          : getComics(id, type),
      type == 'events'
          ? emptyFuture() // Devolver un array vacío en caso de que se quiera filtrar por "eventos"
          : getEvents(id, type),
    ]);

    return MarvelListsData(
      characters: data[0],
      series: data[1],
      comics: data[2],
      events: data[3],
    );
  }

  static Future<List<MarvelListItem>> getCharacters([
    int? id,
    String? type,
  ]) async {
    final query = buildApiParameters();
    final extraParameters = id != null ? '/$type/$id' : '';
    final url = Uri.parse('$apiUrl$extraParameters/characters?$query&limit=50');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['data']['results'] as List<dynamic>;

      return results.where((character) {
        /// Eliminar elementos sin imagen
        return !character['thumbnail']['path']?.contains('image_not_available');
      }).map<MarvelListItem>((character) {
        return Character.fromMap(character);
      }).toList();
    }

    return [];
  }

  static Future<List<MarvelListItem>> getSeries([
    int? id,
    String? type,
  ]) async {
    final query = buildApiParameters();
    final extraParameters = id != null ? '/$type/$id' : '';
    final url = Uri.parse('$apiUrl$extraParameters/series?$query&limit=50');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['data']['results'] as List<dynamic>;
      return results.where((serie) {
        /// Eliminar elementos sin imagen
        return !serie['thumbnail']['path']?.contains('image_not_available');
      }).map<MarvelListItem>((serie) {
        return Serie.fromMap(serie);
      }).toList();
    }

    return [];
  }

  static Future<List<MarvelListItem>> getComics([
    int? id,
    String? type,
  ]) async {
    final query = buildApiParameters();
    final extraParameters = id != null ? '/$type/$id' : '';
    final url = Uri.parse('$apiUrl$extraParameters/comics?$query&limit=50');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['data']['results'] as List<dynamic>;
      return results.where((comic) {
        /// Eliminar elementos sin imagen
        return !comic['thumbnail']['path']?.contains('image_not_available');
      }).map<MarvelListItem>((comic) {
        return Comic.fromMap(comic);
      }).toList();
    }

    return [];
  }

  static Future<List<MarvelListItem>> getEvents([
    int? id,
    String? type,
  ]) async {
    final query = buildApiParameters();
    final extraParameters = id != null ? '/$type/$id' : '';
    final url = Uri.parse('$apiUrl$extraParameters/events?$query&limit=50');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['data']['results'] as List<dynamic>;
      return results.where((event) {
        /// Eliminar elementos sin imagen
        return !event['thumbnail']['path'].contains('image_not_available');
      }).map<MarvelListItem>((event) {
        return Event.fromMap(event);
      }).toList();
    }

    return [];
  }
}
