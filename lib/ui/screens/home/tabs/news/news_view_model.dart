


import 'package:daily_brief/data/repos/news_repo/data_sources/offline_data_source.dart';
import 'package:daily_brief/data/repos/news_repo/data_sources/online_data_source.dart';
import 'package:daily_brief/data/repos/news_repo/news_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../model/SourcesResponse.dart';

class NewsTabViewModel extends Cubit  {


  NewsRepo newsRepo = NewsRepo(OnlineDataSource(), OfflineDataSource());

  NewsTabViewModel(): super(NewsTabLoadingState());

 void getSources (String id )async {
      // isLoading = true;
      // notifyListeners();
  emit(NewsTabLoadingState()) ;
   try {
  SourcesResponse? sourcesResponse =await newsRepo.getSources(id);

   if (sourcesResponse!=null && sourcesResponse.sources?.isNotEmpty==true ) {
     // isLoading = false;
     // sources = sourcesResponse.sources!;
     // notifyListeners();
     emit(NewsTabSuceesState(sourcesResponse.sources!));
   }
   else {
     throw "something went wrong ";}
   }
   catch(error){
    // isLoading = false ;
    // errorText=error.toString();
    // notifyListeners();
     emit(NewsTabErrorState(error.toString()));
   }

 }
}

class NewsTabLoadingState {

}

class NewsTabSuceesState {
 List <Source> sources ;

 NewsTabSuceesState(this.sources);
}

class NewsTabErrorState {
 String errorMessage ;

 NewsTabErrorState(this.errorMessage);
}