import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isColumn;
  final double size;

  const TextIcon(
      {Key key,
        @required this.icon,
        @required this.text,
        this.isColumn = true,
        this.size = 12})
      : assert(size <= 24.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isColumn) {
      return Container(
        height: 50.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(icon),
            Text(text),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: size),
            ),
            SizedBox(
              width: 4.0,
            ),
            Icon(
              icon,
              size: size,
            ),
          ],
        ),
      );
    }
  }
}
