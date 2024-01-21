import 'package:flutter/material.dart';
import 'package:flutter_jira_clone/view/components/custom_reorderable_row.dart';

import '../components/custom_reorderable_row_item_card.dart';
import '../components/custom_reorderable_row_item_title.dart';

class KanbanPage extends StatefulWidget {
  const KanbanPage({super.key});

  @override
  State<KanbanPage> createState() => _KanbanPageState();
}

class _KanbanPageState extends State<KanbanPage> {

  List<Widget> titlesList() => [
    CustomReorderableRowItemTitle(title: "Backlog"),
    CustomReorderableRowItemTitle(title: "InProgress"),
    CustomReorderableRowItemTitle(title: "ReadyToCodeReview"),
    CustomReorderableRowItemTitle(title: "InCodeReview"),
    CustomReorderableRowItemTitle(title: "ReadyToTest"),
    CustomReorderableRowItemTitle(title: "InTest"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32),
      scrollDirection: Axis.horizontal,
      children: [
        Column(
          children: [
            SizedBox(
              width: titlesList().length * 200,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: titlesList(),
              ),
            ),
            SizedBox(
              width: titlesList().length * 200,
              child: CustomReorderableRow(
                  titleSize: titlesList().length,
                  card: CustomReorderableRowItemCard(
                    key: const ValueKey("Card"),
                    color: Colors.white,
                    shadow: Colors.black,
                    title: "CARD",
                  )
              ),
            ),
            SizedBox(
              width: titlesList().length * 200,
              child: CustomReorderableRow(
                  titleSize: titlesList().length,
                  card: CustomReorderableRowItemCard(
                    key: const ValueKey("Card2"),
                    color: Colors.white,
                    shadow: Colors.black,
                    title: "CARD2",
                  )
              ),
            ),
          ],
        )
      ],
    );
  }
}
