import 'package:flutter/material.dart';
import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';
import 'package:ucp_flutter_demo_app/src/widgets/marvel_item_title.dart';

class HorizontalMarvelList extends StatelessWidget {
  const HorizontalMarvelList({
    Key? key,
    required this.items,
    required this.title,
    this.small = false,
  }) : super(key: key);

  final bool small;
  final String title;
  final List<MarvelListItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: small ? 15 : 20,
            ),
          ),
        ),
        SizedBox(
          height: small ? 150 : 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 5),
            itemCount: items.length,
            itemBuilder: (context, index) => _MarvelItemList(
              small: small,
              item: items[index],
            ),
          ),
        ),
      ],
    );
  }
}

class _MarvelItemList extends StatelessWidget {
  const _MarvelItemList({
    Key? key,
    required this.item,
    required this.small,
  }) : super(key: key);

  final bool small;
  final MarvelListItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('detail', arguments: item);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Hero(
              tag: item.heroTag,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image(
                  image: NetworkImage(item.img),
                  height: small ? 150 : 250,
                  width: small ? 100 : 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Opacity(
                opacity: 0.7,
                child: MarvelItemTitle(
                  small: small,
                  title: item.title,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
