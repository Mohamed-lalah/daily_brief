


import 'package:daily_brief/data/api/api_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../model/SourcesResponse.dart';

class NewsTabViewModel extends ChangeNotifier  {

 List <Source> sources = [];
  bool isLoading = false ;
  String? errorText;

 void getSources (String id )async {
      isLoading = true;
      notifyListeners();
   try {
     sources = await ApiManager.getSources(id);
     isLoading = false ;
     notifyListeners();
   }
   catch(error){
    isLoading = false ;
    errorText=error.toString();
    notifyListeners();
   }

 }
}