import 'dart:convert';

import 'package:daily_brief/model/ArticleResponse.dart';
import 'package:daily_brief/model/SourcesResponse.dart';
import 'package:http/http.dart' ;

abstract class ApiManager {

  static const String baseUrl= "newsapi.org";
  static const String apiKey = "e00e56ef3a114b54bc9f2ee3c29aa900";
  static const String endPoint= "v2/top-headlines/sources";
  static const String endPointArtilce= "/v2/everything";


  static Future< List <Source>> getSources(String categoryId) async{

    Uri  url = Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=$apiKey&category=$categoryId");

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





  static Future <List <Articles>> getArticles(String sourceId)async{

    Uri url = Uri.https(baseUrl, endPointArtilce,{
      "apiKey" : apiKey,
      "sources" : sourceId,
    });

    var serverResponse= await get(url);


    Map json = jsonDecode(serverResponse.body);


    ArticleResponse articleResponse = ArticleResponse.fromJson(json);


    if (serverResponse.statusCode>=200 && serverResponse.statusCode<300 &&
        articleResponse.articles?.isNotEmpty==true){
      return articleResponse.articles!;
    }
    else {
      throw Exception(articleResponse.message);
    }



  }
}