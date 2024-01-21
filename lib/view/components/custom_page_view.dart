import 'package:flutter/material.dart';
import 'package:flutter_jira_clone/view/pages/kanban_page.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key, required this.pageController});

  final PageController pageController;
  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: widget.pageController,
        children: [
          Container(
            color: Colors.white,
            child: const Center(child: Text('Dashboard', style: TextStyle(fontSize: 35))),
          ),
          const KanbanPage(),
          Container(
            color: Colors.white,
            child: const Center(child: Text('Files', style: TextStyle(fontSize: 35))),
          ),
          Container(
            color: Colors.white,
            child: const Center(child: Text('Download', style: TextStyle(fontSize: 35))),
          ),
          Container(
            color: Colors.white,
            child: const Center(child: Text('Settings', style: TextStyle(fontSize: 35))),
          ),
          Container(
            color: Colors.white,
            child: const Center(child: Text('Only Title', style: TextStyle(fontSize: 35))),
          ),
          Container(
            color: Colors.white,
            child: const Center(child: Text('Only Icon', style: TextStyle(fontSize: 35))),
          ),
        ],
      ),
    );
  }
}
