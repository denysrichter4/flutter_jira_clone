import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class CustomSideMenu extends StatefulWidget {
  const CustomSideMenu({super.key, required this.sideMenu});
  final SideMenuController sideMenu;
  @override
  State<CustomSideMenu> createState() => _CustomSideMenuState();
}

class _CustomSideMenuState extends State<CustomSideMenu> {

  List<SideMenuItem> itemsList() => [
    SideMenuItem(
      title: 'Dashboard',
      onTap: (index, _) => widget.sideMenu.changePage(index),
      icon: const Icon(Icons.home),
    ),
    SideMenuItem(
      title: 'Kanban Board',
      onTap: (index, _) => widget.sideMenu.changePage(index),
      icon: const Icon(Icons.table_chart),
    ),
    SideMenuItem(
      title: 'Files',
      onTap: (index, _) => widget.sideMenu.changePage(index),
      icon: const Icon(Icons.file_copy_rounded),
    ),
    SideMenuItem(
      title: 'Download',
      onTap: (index, _) => widget.sideMenu.changePage(index),
      icon: const Icon(Icons.download),
    ),
    SideMenuItem(
      builder: (context, displayMode) => const Divider(endIndent: 8, indent: 8,),
    ),
    SideMenuItem(
      title: 'Settings',
      onTap: (index, _) => widget.sideMenu.changePage(index),
      icon: const Icon(Icons.settings),
    ),
    SideMenuItem(
      title: 'Exit',
      onTap: (index, _) => widget.sideMenu.changePage(index),
      icon: const Icon(Icons.exit_to_app),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      controller: widget.sideMenu,
      showToggle: true,
      style: SideMenuStyle(
        compactSideMenuWidth: 60,
        displayMode: SideMenuDisplayMode.compact,
        hoverColor: Colors.blue[100],
        selectedHoverColor: Colors.blue[100],
        selectedColor: Colors.blue[800],
        selectedTitleTextStyle: const TextStyle(color: Colors.white),
        selectedIconColor: Colors.white,
      ),
      title: const SizedBox(width: 40, height: 80,),
      items: itemsList(),
    );
  }
}
