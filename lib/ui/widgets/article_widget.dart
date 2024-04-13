import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/ArticleResponse.dart';

class ArtilceWidget extends StatelessWidget {

  late Articles aritcles ;

  ArtilceWidget({super.key, required this.aritcles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       ClipRRect(
         borderRadius: BorderRadius.circular(22),
         child: CachedNetworkImage(imageUrl : aritcles.urlToImage!,
         placeholder: (_, __)=>Center(child: CircularProgressIndicator()),
         errorWidget: (_,__,___)=>Icon(Icons.error),
         height: MediaQuery.of(context).size.height*0.12,),
       ),
        Text(aritcles.source?.name??""),
        SizedBox(height: 4,),
        Text(aritcles.title??""),
        SizedBox(height: 4,),
        Text(aritcles.publishedAt??"",textAlign: TextAlign.end,),
      ],
    );
  }
}
