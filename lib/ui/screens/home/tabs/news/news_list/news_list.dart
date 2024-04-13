import 'package:daily_brief/data/api/api_manager.dart';
import 'package:daily_brief/model/ArticleResponse.dart';
import 'package:daily_brief/ui/widgets/error_view.dart';
import 'package:daily_brief/ui/widgets/loading.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {

   late   String sourceId;
   NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        future: ApiManager.getArticles(sourceId),

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

  Widget buildArticleView( List <Articles> articles ) {
    return Center();
  }
}
