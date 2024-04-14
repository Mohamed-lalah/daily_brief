import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/ArticleResponse.dart';

class ArtilceWidget extends StatelessWidget {

  late Articles aritcles ;

  ArtilceWidget({super.key, required this.aritcles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(15),
           child: CachedNetworkImage(
             fit: BoxFit.fill,
             imageUrl : aritcles.urlToImage!,
           placeholder: (_, __)=>Center(child: CircularProgressIndicator()),
           errorWidget: (_,__,___)=>Icon(Icons.error),
           height: MediaQuery.of(context).size.height*.25,),
         ),
          Text(aritcles.source?.name??""),
          SizedBox(height: 4,),
          Text(aritcles.title??""),
          SizedBox(height: 4,),
          Text(aritcles.publishedAt??"",textAlign: TextAlign.end,),
        ],
      ),
    );
  }
}
