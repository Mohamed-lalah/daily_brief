import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_brief/ui/screens/home/home_screen.dart';
import 'package:daily_brief/ui/screens/home/tabs/news/news_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  await FirebaseFirestore.instance.disableNetwork();

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
