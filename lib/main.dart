import 'package:flutter/material.dart';
import 'package:flutter_jira_clone/view/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Jira Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Jira Clone'),
      debugShowCheckedModeBanner: false,
    );
  }
}