import 'package:daily_brief/data/repos/news_repo/data_sources/online_data_source.dart';
import 'package:daily_brief/model/ArticleResponse.dart';
import 'package:daily_brief/ui/widgets/article_widget.dart';
import 'package:daily_brief/ui/widgets/error_view.dart';
import 'package:daily_brief/ui/widgets/loading.dart';
import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {

   late   String sourceId;
   NewsList({super.key, required this.sourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late  ScrollController scrollController ;
  List <Articles> allArticles =[];
  int page = 1;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController= ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge){
        if (scrollController.offset!=0){
          setState(() {});
          page++;
        }
      }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        future: OnlineDataSource().getArticles(sourceId: widget.sourceId, page: page),

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

    return ListView.builder(
        controller: scrollController,
        itemCount: articles.length,
        itemBuilder: (context , index ){
          return ArtilceWidget(aritcles:  articles[index],);
        });
  }
}
