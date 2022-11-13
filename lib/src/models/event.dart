import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';

class Event extends MarvelListItem {
  final int _id;
  final String name;
  final String _description;
  final String image;

  Event({
    required int id,
    required this.name,
    required this.image,
    required String description,
  })  : _id = id,
        _description = description;

  @override
  int get id => _id;

  @override
  String get title => name;

  @override
  String get img => image;

  @override
  String get heroTag => 'event-$id';

  @override
  String get description => _description;

  @override
  String get type => 'events';

  factory Event.fromMap(Map<String, dynamic> data) {
    return Event(
      id: data['id'],
      name: data['title'] ?? 'No Title',
      image: '${data['thumbnail']['path']}.${data['thumbnail']['extension']}',
      description: data['description'] ?? '',
    );
  }
}
