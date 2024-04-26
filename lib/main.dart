import 'package:daily_brief/ui/screens/home/home_screen.dart';
import 'package:daily_brief/ui/screens/home/tabs/news/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      routes: {
        HomeScreen.routeName : (_)=> HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
