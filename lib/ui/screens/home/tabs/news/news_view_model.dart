


import 'package:daily_brief/data/repos/news_repo/data_sources/offline_data_source.dart';
import 'package:daily_brief/data/repos/news_repo/data_sources/online_data_source.dart';
import 'package:daily_brief/data/repos/news_repo/news_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../model/SourcesResponse.dart';

class NewsTabViewModel extends ChangeNotifier  {

 List <Source> sources = [];
  bool isLoading = false ;
  String? errorText;
  NewsRepo newsRepo = NewsRepo(OnlineDataSource(), OfflineDataSource());

 void getSources (String id )async {
      isLoading = true;
      notifyListeners();
   try {
  SourcesResponse? sourcesResponse =await newsRepo.getSources(id);

   if (sourcesResponse!=null && sourcesResponse.sources?.isNotEmpty==true ) {
     isLoading = false;
     sources = sourcesResponse.sources!;
     notifyListeners();
   }
   else {
     throw "something went wrong ";}
   }
   catch(error){
    isLoading = false ;
    errorText=error.toString();
    notifyListeners();
   }

 }
}