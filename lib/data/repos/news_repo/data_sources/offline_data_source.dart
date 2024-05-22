import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_brief/model/SourcesResponse.dart';
import 'package:hive/hive.dart';
class OfflineDataSource {

  Future <SourcesResponse?> getSource(String categoryId )async{

    CollectionReference tabsCollection = FirebaseFirestore.instance.collection("tabs");

    DocumentReference documentReference=  tabsCollection.doc(categoryId);

    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.data()==null){
      return null;
    }
    else {
      return SourcesResponse.fromJson(documentSnapshot.data());
    }

  }
  void saveSources (SourcesResponse sourcesResponse,String categoryId ){

   CollectionReference tabsCollection= FirebaseFirestore.instance.collection("tabs");
   DocumentReference tabsDocument= tabsCollection.doc(categoryId);
   tabsDocument.set(sourcesResponse.toJson());

  }






  void saveSourcesInHive(SourcesResponse sourcesResponse , String categoryId)async{
    var box =await  Hive.openBox("tabs");
    box.put(categoryId, sourcesResponse.toJson());
    box.close();
  }


  Future <SourcesResponse> getSourcesFromHive(String categoryId)async{
    var box =await  Hive.openBox("tabs");
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(box.get(categoryId));
    return sourcesResponse;


  }

}