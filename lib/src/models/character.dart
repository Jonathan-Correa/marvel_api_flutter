import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';

class Character extends MarvelListItem {
  final int id;
  final String name;
  final String description;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  String get title => name;

  @override
  String get img => image;

  factory Character.fromMap(Map<String, dynamic> data) {
    return Character(
      id: data['id'],
      name: data['name'],
      image: '${data['thumbnail']['path']}.${data['thumbnail']['extension']}',
      description: data['description'],
    );
  }
}
