import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/api/api_manager.dart';
import '../../../../../model/SourcesResponse.dart';

class NewsTab extends StatefulWidget {
   NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
 int currentTabIndex= 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body:
           FutureBuilder(
               future: ApiManager.getSources(),
               builder: (context , snapshot){
                  if (snapshot.hasData){
                 return buildTabs(snapshot.data!);
                 }
                 else if (snapshot.hasError){
                   return Text(snapshot.error.toString());
                 }

                 else
                   return const Center(child: CircularProgressIndicator(
                     color:Color(0xff39A552) ,));
               }),
    );
  }

  Widget buildTabs(List<Source> list ) {
   return  DefaultTabController(
     length: list.length,
     child: Column(
       children: [
         SizedBox(height: 10,),
          TabBar
           (
            onTap: (index){
              currentTabIndex= index;
              setState(() {
              });
            },
            isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: list.map((source) => buildSourceTab(source.name??" ",
                  currentTabIndex==list.indexOf(source)
              )
              ).toList(),


      ),
         SizedBox(height: 8,),
         Expanded(
           child: TabBarView(
               children:
                 list.map((source) => Container(color: Colors.red,)).toList()

           ),
         )
      ]
     ),
   );
  }

  Widget buildSourceTab(String name,bool isSelected) {
    return Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: isSelected? Color(0xff39A552) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border:  Border.all(color: Color(0xff39A552))
      ),

      child: Text(name,
          style:  TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: isSelected? Colors.white : Color(0xff39A552)),


          )
    );
  }
}
