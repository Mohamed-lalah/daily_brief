import 'package:daily_brief/data/repos/news_repo/data_sources/online_data_source.dart';
import 'package:daily_brief/model/category_model.dart';
import 'package:daily_brief/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:daily_brief/ui/screens/home/tabs/news/news_tab.dart';
import 'package:daily_brief/ui/screens/home/tabs/settings/setting_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/ArticleResponse.dart';
import '../../widgets/article_widget.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading.dart';

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
        child: Container(
          decoration:  const BoxDecoration(
            image: DecorationImage(
              image:AssetImage("assets/background.png"), fit: BoxFit.fill
            )
          ),
          child: Scaffold(
            drawerEnableOpenDragGesture: false,
            appBar: AppBar(
              backgroundColor: Color(0xff39A552),
              centerTitle: true,
              toolbarHeight: MediaQuery.of(context).size.height*0.12,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom:Radius.circular(30)
                )
              ),
              title: Text("Daily Brief",style: GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 22
              ),),
                actions: currentTab is NewsTab?
                [
                IconButton(onPressed: (){
                  showSearch(context: context, delegate: NewsDelegate());
                }, icon: Icon(Icons.search),color: Colors.white,iconSize: 30,)]: null
            ),
            drawer: buildDarwer(),
            body: currentTab
          ),
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
           DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff39A552)
              ),
              child: Center(child: Text("Daily Brief",style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26
              ),))),


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
          Icon(icon,color: Colors.black ,size: 30,),
          SizedBox(width: 12,),
          Text(title, style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff303030)
          ),),
        ],
      ),
    );
   }


}
class NewsDelegate extends  SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      Icon(Icons.search, size:  30 , color: Colors.black,)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return Text( "");
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(

        future: OnlineDataSource().getArticles(query: query),

        builder: (context , snapshot ){
          if (snapshot.hasData){
            return buildArticleView(snapshot.data!);
          }
          else if (snapshot.hasError){
            return ErrorView(errorMessage: snapshot.error.toString());
          }
          else {
            return Loading();
          }
        });

  }

  @override
  Widget buildSuggestions(BuildContext context) {
         return Container(
         );
  }

}
Widget buildArticleView( List <Articles> articles ) {

  return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context , index ){
        return ArtilceWidget(aritcles:  articles[index],);
      });
}


