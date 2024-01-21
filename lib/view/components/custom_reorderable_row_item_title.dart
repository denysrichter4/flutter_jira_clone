import 'package:flutter/material.dart';

class CustomReorderableRowItemTitle extends StatelessWidget {
  const CustomReorderableRowItemTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 25,
      color: Colors.transparent,
      child: Center(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo),)),
    );
  }
}
