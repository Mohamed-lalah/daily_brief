import 'dart:convert';

import 'package:daily_brief/model/SourcesResponse.dart';
import 'package:http/http.dart' ;

abstract class ApiManager {

  static const String baseUrl= "newsapi.org";
  static const String apiKey = "e00e56ef3a114b54bc9f2ee3c29aa900";
  static const String endPoint= "v2/top-headlines/sources";
  
  static Future< List <Source>> getSources() async{

    Uri  url = Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=$apiKey");

      Response response =await get(url);

      Map json = jsonDecode(response.body);

      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);

      if (response.statusCode>=200 && response.statusCode<300 &&
          sourcesResponse.sources?.isNotEmpty==true){
        return sourcesResponse.sources!;
      }
      else {
       throw Exception(sourcesResponse.message);
      }
  }


  static getArticles(){

  }
}