
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daily_brief/data/repos/news_repo/data_sources/offline_data_source.dart';
import 'package:daily_brief/data/repos/news_repo/data_sources/online_data_source.dart';
import 'package:daily_brief/model/SourcesResponse.dart';
class  NewsRepo {
late OnlineDataSource onlineDataSource ;
late OfflineDataSource offlineDataSource ;


NewsRepo(this.onlineDataSource, this.offlineDataSource);

 Future < SourcesResponse?> getSources (String categoryId )async{
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult==ConnectivityResult.wifi|| connectivityResult== ConnectivityResult.mobile){
      SourcesResponse? sourcesResponse = await  onlineDataSource.getSources(categoryId);
      offlineDataSource.saveSources(sourcesResponse,categoryId);
      return sourcesResponse;
    }

    else {
     return offlineDataSource.getSource(categoryId);
    }

  }


}