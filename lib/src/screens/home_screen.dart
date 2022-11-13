import 'package:flutter/material.dart';
import 'package:ucp_flutter_demo_app/src/models/home_screen_data.dart';
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
      body: FutureBuilder(
        future: MarvelService.getMarvelData(),
        builder: (context, AsyncSnapshot<MarvelListsData> snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snap.connectionState == ConnectionState.done && snap.hasData) {
            return ListView(
              padding: const EdgeInsets.only(bottom: 20),
              children: [
                HorizontalMarvelList(
                  title: 'Personajes',
                  items: snap.data!.characters,
                ),
                HorizontalMarvelList(
                  title: 'Series',
                  items: snap.data!.series,
                ),
                HorizontalMarvelList(
                  title: 'Comics',
                  items: snap.data!.comics,
                ),
                HorizontalMarvelList(
                  title: 'Eventos',
                  items: snap.data!.events,
                ),
              ],
            );
          }

          return const Center(
            child: Text('Ha ocurrido un error al obtener los datos'),
          );
        },
      ),
    );
  }
}
