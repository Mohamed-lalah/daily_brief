import 'dart:ui';

import 'package:flutter/material.dart';

 class CategoryDm {
  late String id ;
  late String imagePath ;
  late Color backGroundColor ;
  late String title ;
  late bool isLeftSide;

  CategoryDm({required this.id, required this.imagePath, required this.backGroundColor, required this.title, required this.isLeftSide});

  static List <CategoryDm> dmList = [

    CategoryDm(id: "sport" ,imagePath: "assets/sports.png" , backGroundColor: Colors.red[900]!,title: "Sports" ,isLeftSide: true),

    CategoryDm(id: "technology" ,imagePath: "assets/Politics.png" , backGroundColor: Colors.blue[900]!,title: "Technology" ,isLeftSide: false),

    CategoryDm(id: "health" ,imagePath: "assets/health.png" , backGroundColor: Colors.pink,title: "Health" ,isLeftSide: true),

    CategoryDm(id: "business" ,imagePath: "assets/bussines.png" , backGroundColor: Colors.orange[900]!,title: "Business" ,isLeftSide: false),

    CategoryDm(id: "entertainment" ,imagePath: "assets/environment.png" , backGroundColor: Colors.lightBlue,title: "Entertainment" ,isLeftSide: true),

    CategoryDm(id: "science" ,imagePath: "assets/science.png" , backGroundColor: Colors.yellow[500]!,title: "Science" ,isLeftSide: false),
  ];
}