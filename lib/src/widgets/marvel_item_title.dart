import 'package:flutter/material.dart';

class MarvelItemTitle extends StatelessWidget {
  const MarvelItemTitle({
    Key? key,
    required this.title,
    this.color = Colors.black,
    this.fontSize = 15,
    this.small = false,
  }) : super(key: key);

  final bool small;
  final String title;
  final Color? color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: small ? 100 : 150,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: small ? 10 : fontSize,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
