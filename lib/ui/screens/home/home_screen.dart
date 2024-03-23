import 'package:daily_brief/data/api/api_manager.dart';
import 'package:daily_brief/ui/screens/home/tabs/news/news_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const  String routeName = "home screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Brief"),
      ),
      body: NewsTab(),
    );
  }
}
