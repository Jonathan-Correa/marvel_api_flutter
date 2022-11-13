import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';

class MarvelListsData {
  const MarvelListsData({
    required this.series,
    required this.comics,
    required this.events,
    required this.characters,
  });

  final List<MarvelListItem> characters;
  final List<MarvelListItem> series;
  final List<MarvelListItem> comics;
  final List<MarvelListItem> events;
}
