import 'package:flutter/material.dart';
import 'package:ucp_flutter_demo_app/src/models/home_screen_data.dart';
import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';
import 'package:ucp_flutter_demo_app/src/services/marvel_service.dart';
import 'package:ucp_flutter_demo_app/src/widgets/detail_header.dart';
import 'package:ucp_flutter_demo_app/src/widgets/horizontal_list.dart';
import 'package:ucp_flutter_demo_app/src/widgets/marvel_item_title.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MarvelListItem item;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          DetailHeader(
            image: item.img,
            heroTag: item.heroTag,
          ),
          MarvelItemTitle(
            title: item.title,
            fontSize: 23,
            color: const Color.fromARGB(255, 40, 40, 40),
          ),
          if (item.description.isNotEmpty)
            _ItemDescription(text: item.description),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FutureBuilder(
              future: MarvelService.getMarvelData(item.id, item.type),
              builder: (context, AsyncSnapshot<MarvelListsData> snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: screenSize.height * 0.4,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (snap.connectionState == ConnectionState.done &&
                    snap.hasData) {
                  return Column(
                    children: [
                      if (snap.data!.characters.isNotEmpty)
                        HorizontalMarvelList(
                          small: true,
                          title: 'Personajes',
                          items: snap.data!.characters,
                        ),
                      if (snap.data!.series.isNotEmpty)
                        HorizontalMarvelList(
                          small: true,
                          title: 'Series',
                          items: snap.data!.series,
                        ),
                      if (snap.data!.comics.isNotEmpty)
                        HorizontalMarvelList(
                          small: true,
                          title: 'Comics',
                          items: snap.data!.comics,
                        ),
                      if (snap.data!.events.isNotEmpty)
                        HorizontalMarvelList(
                          small: true,
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
          )
        ],
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: theme.textTheme.subtitle1!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
