import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import '../components/custom_page_view.dart';
import '../components/custom_side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    sideMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.domain_add_rounded, color: Colors.white,),
        title: Row(
          children: [
            Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            IconButton(
                onPressed: (){

                },
                icon: const Icon(Icons.add_box_outlined)
            )
          ],
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSideMenu(sideMenu: sideMenu),
          CustomPageView(pageController: pageController)
        ],
      ),
    );
  }
}