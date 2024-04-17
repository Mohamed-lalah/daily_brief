import 'package:daily_brief/data/api/api_manager.dart';
import 'package:daily_brief/model/category_model.dart';
import 'package:daily_brief/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:daily_brief/ui/screens/home/tabs/news/news_tab.dart';
import 'package:daily_brief/ui/screens/home/tabs/settings/setting_tab.dart';
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
    return SafeArea(
      child: WillPopScope(
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
          drawerEnableOpenDragGesture: false,
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
          drawer: buildDarwer(),
          body: currentTab
        ),
      ),
    );
  }

  onCategoryClick (CategoryDm categoryDm){
    currentTab= NewsTab(categoryId: categoryDm.id,);
    setState(() {});

  }

   Widget buildDarwer() {
    return  Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff39A552)
              ),
              child: Center(child: Text("Daily Brief"))),


          buildDrawerRow("Categories",Icons.list,(){
            currentTab= CategoriesTab(categoryClick: onCategoryClick,);
            setState(() {});
            Navigator.pop(context);
          }),
          buildDrawerRow("Setting", Icons.settings,(){
            currentTab= SettingTab();
            setState(() {});
            Navigator.pop(context);


          })
        ],
      ),

    );
   }
   Widget  buildDrawerRow(String title , IconData icon , Function onClick){
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Row(
        children: [
          Icon(icon,color: Colors.black ,size: 35,),
          SizedBox(width: 8,),
          Text(title),
        ],
      ),
    );
   }


}

