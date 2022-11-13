import 'package:flutter/material.dart';
import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';
import 'package:ucp_flutter_demo_app/src/screens/character_detail_screen.dart';
import 'package:ucp_flutter_demo_app/src/screens/home_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  late Widget screen;

  switch (settings.name) {
    case 'detail':
      screen = CharacterDetailScreen(
        item: settings.arguments as MarvelListItem,
      );

      break;
    default:
      screen = const HomeScreen();
  }

  return MaterialPageRoute(builder: (context) => screen);
}
