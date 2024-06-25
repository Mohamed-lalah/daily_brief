import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_brief/ui/screens/ScreenDetail/screen_detail.dart';
import 'package:flutter/material.dart';

import '../../model/ArticleResponse.dart';

class ArtilceWidget extends StatefulWidget {

  late Articles aritcles ;

  ArtilceWidget({super.key, required this.aritcles});

  @override
  State<ArtilceWidget> createState() => _ArtilceWidgetState();
}

class _ArtilceWidgetState extends State<ArtilceWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ScreenDetails.routeName, arguments: widget.aritcles);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(15),
             child: CachedNetworkImage(
               fit: BoxFit.fill,
               imageUrl : widget.aritcles.urlToImage!,
             placeholder: (_, __)=>Center(child: CircularProgressIndicator()),
             errorWidget: (_,__,___)=>Icon(Icons.error),
             height: MediaQuery.of(context).size.height*.25,),
           ),
            Text(widget.aritcles.source?.name??""),
            SizedBox(height: 4,),
            Text(widget.aritcles.title??""),
            SizedBox(height: 4,),
            Text(widget.aritcles.publishedAt??"",textAlign: TextAlign.end,),
          ],
        ),
      ),
    );
  }
}
