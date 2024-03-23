import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/api/api_manager.dart';
import '../../../../../model/SourcesResponse.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body:
           FutureBuilder(
               future: ApiManager.getSources(),
               builder: (context , snapshot){
                 if (snapshot.hasError){
                   return Text(snapshot.data.toString());
                 }
                 else if (snapshot.hasData){
                   return buildTabs(snapshot.data!);
                 }
                 else
                   return const Center(child: CircularProgressIndicator());
               }),
    );
  }

  Widget buildTabs(List<Source> list ) {
   return  DefaultTabController(
     length: 2,
     child: Column(
       children: [
         const TabBar
           (tabs: [Text("1"), Text("2")]
      ),
         TabBarView(
             children: [
           Container(color: Colors.red,),
           Container(color: Colors.white,)
         ]
         )
      ]
     ),
   );
  }
}
