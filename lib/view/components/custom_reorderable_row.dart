import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'custom_reorderable_row_item_card.dart';
import 'package:crypto/crypto.dart';

class CustomReorderableRow extends StatefulWidget {
  const CustomReorderableRow({Key? key, required this.titleSize, required this.card}) : super(key: key);
  final int titleSize;
  final Widget card;

  @override
  CustomReorderableRowState createState() => CustomReorderableRowState();
}

class CustomReorderableRowState extends State<CustomReorderableRow> {
  final List<Widget> _columns = [];
  ScrollController scrollController = ScrollController();

  String generateRandomHash() {
    final random = Random.secure();
    final bytes = Uint8List(16); // Tamanho do hash em bytes (pode ajustar conforme necessário)

    for (int i = 0; i < bytes.length; i++) {
      bytes[i] = random.nextInt(256);
    }

    final hash = sha256.convert(bytes);

    return hash.toString();
  }

  void setInvisibleCards(){
    for (var i = 0; i < (widget.titleSize - 1); i++) {
      _columns.add(
          CustomReorderableRowItemCard(
            key: ValueKey("keyInvisibleCard$i$generateRandomHash()" ),
            color: Colors.transparent,
            shadow: Colors.transparent,
            title: "",
          )
      );
    }
  }

  void onReorder(int oldIndex, int newIndex) {
    print("$oldIndex, $newIndex");
    setState(() {
      Widget col = _columns.removeAt(oldIndex);
      _columns.insert(newIndex, col);
    });
  }

  @override
  void initState() {
    super.initState();
    _columns.add(widget.card);
    setInvisibleCards();
  }

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      scrollController: scrollController,
      mainAxisSize: MainAxisSize.min,
      needsLongPressDraggable: false,
      onReorder: onReorder,
      children: _columns,
    );
  }
}