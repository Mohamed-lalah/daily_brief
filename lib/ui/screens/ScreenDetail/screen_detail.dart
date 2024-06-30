import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_brief/ui/screens/webview/webview_screen.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width*0.03, right: width*0.02, top: height*0.01,bottom: height*0.01),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl : arguments.urlToImage!,
                  placeholder: (_, __)=>Center(child: CircularProgressIndicator()),
                  errorWidget: (_,__,___)=>Icon(Icons.error),
                  height: MediaQuery.of(context).size.height*.25,
                  width: width*0.98,
                ),
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

                   SizedBox(height: height*0.01,),

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
                   SizedBox(height: height*0.03,),

                   Text(arguments.content??"",style: const TextStyle(
                     color: Color(0xff42505C),fontWeight: FontWeight.normal,fontSize: 13
                   ),),
                   SizedBox(height: height*0.05,),
                    InkWell(
                      highlightColor: Colors.grey,
                      onTap: (){
                        Navigator.pushNamed(context, WebViewScreen.routeName, arguments: arguments.url);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text("View Full Article",style: TextStyle(
                           color: Color(0xff42505C),fontWeight: FontWeight.w500,fontSize: 14
                         ),),
                         SizedBox(width: width*0.01,),
                         Icon(Icons.arrow_right,color: Colors.black,size: 20,)
                       ],
                   ),
                    )

                ],
            ),
             )

          ],
        ),
      ),

    );
  }
}
