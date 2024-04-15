import 'package:daily_brief/data/api/api_manager.dart';
import 'package:daily_brief/model/category_model.dart';
import 'package:daily_brief/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:daily_brief/ui/screens/home/tabs/news/news_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  static const  String routeName = "home screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab ;
  @override
  void initState() {
    super.initState();
    currentTab=  CategoriesTab(categoryClick: onCategoryClick,);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if (currentTab is! CategoriesTab){
          currentTab=CategoriesTab(categoryClick: onCategoryClick,) ;
          setState(() {});
          return false ;
        }else {
          return true;
        }

      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height*0.09,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:Radius.circular(22)
            )
          ),
          title: Text("Daily Brief"),
        ),
        body: currentTab
      ),
    );
  }

  onCategoryClick (CategoryDm categoryDm){
    currentTab= NewsTab(categoryId: categoryDm.id,);
    setState(() {});

  }
}

