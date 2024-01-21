import 'package:flutter/material.dart';

class CustomReorderableRowItemCard extends StatelessWidget {
  CustomReorderableRowItemCard({super.key, required this.title, required this.color, required this.shadow});
  String title;
  Color? color;
  Color? shadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: key,
      width: 200,
      height: 150,
      child: title == "" ? null :Card(
        margin: EdgeInsets.all(8),
        shadowColor: shadow,
        elevation: 4,
        color: color,
        child: Text(title),
      ),
    );
  }
}
