import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    Key? key,
    required this.image,
    required this.heroTag,
  }) : super(key: key);

  final String image;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: heroTag,
          child: Image(image: NetworkImage(image)),
        ),
        Positioned(
          top: 20,
          left: 0,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              shadows: [
                Shadow(color: Colors.black, blurRadius: 1),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
