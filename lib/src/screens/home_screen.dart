import 'package:flutter/material.dart';
import 'package:ucp_flutter_demo_app/src/models/character.dart';
import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';
import 'package:ucp_flutter_demo_app/src/services/marvel_service.dart';
import 'package:ucp_flutter_demo_app/src/widgets/horizontal_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MARVEL API')),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: MarvelService.getCharacters(),
            builder: (context, AsyncSnapshot<List<MarvelListItem>> snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snap.connectionState == ConnectionState.done &&
                  snap.hasData) {
                return HorizontalMarvelList(
                  title: 'Personajes',
                  items: snap.data!,
                );
              }

              print(snap.error);

              return const Text('Ha ocurrido un error al obtener los datos');
            },
          ),
        ),
      ]),
    );
  }
}
