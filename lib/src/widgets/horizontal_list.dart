import 'package:flutter/material.dart';
import 'package:ucp_flutter_demo_app/src/models/marvel_list_item.dart';

class HorizontalMarvelList extends StatelessWidget {
  const HorizontalMarvelList({
    Key? key,
    required this.items,
    required this.title,
  }) : super(key: key);

  final List<MarvelListItem> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 5),
            itemCount: items.length,
            itemBuilder: (context, index) => _MarvelItemList(
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
  }) : super(key: key);

  final MarvelListItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Image(
            image: NetworkImage(item.img),
            height: 250,
            width: 150,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                width: 150,
                padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(color: Colors.black),
                child: Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
