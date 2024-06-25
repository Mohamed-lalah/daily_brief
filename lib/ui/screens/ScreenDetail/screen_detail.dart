import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/ArticleResponse.dart';
import 'package:timeago/timeago.dart' as timeago;
class ScreenDetails extends StatelessWidget {
   ScreenDetails({super.key});
 static const String routeName = "detailsScreen";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var arguments= ModalRoute.of(context)?.settings.arguments as Articles;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.09,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom:Radius.circular(22)
            )
        ),
        title: Text(arguments.title??"Title"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.all(width*0.015),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl : arguments.urlToImage!,
                placeholder: (_, __)=>Center(child: CircularProgressIndicator()),
                errorWidget: (_,__,___)=>Icon(Icons.error),
                height: MediaQuery.of(context).size.height*.25,),
            ),
          ),
          SizedBox(height: height*0.03,),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: width*0.04),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text(arguments.source?.name??"",style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff79828B)
                ),),

                 SizedBox(height: height*0.02,),

                Text(arguments.title??""),

                 SizedBox(height: height*0.02,),

                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    timeago.format(DateTime.parse(arguments.publishedAt??""))
                    ,style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffA3A3A3)
                  ),),
                ),
              ],
          ),
           )

        ],
      ),

    );
  }
}
