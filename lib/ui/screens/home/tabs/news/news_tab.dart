import 'package:daily_brief/ui/screens/home/tabs/news/news_view_model.dart';
import 'package:daily_brief/ui/widgets/error_view.dart';
import 'package:daily_brief/ui/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/api/api_manager.dart';
import '../../../../../model/SourcesResponse.dart';
import 'news_list/news_list.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {

   NewsTab({super.key, required this.categoryId});

   late String categoryId;
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {

 int currentTabIndex= 0;
 late NewsTabViewModel viewModel;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getSources(widget.categoryId); /// wait for the build method to finish building the screen and then do what is inside the fun
    });
  }

 @override


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=>viewModel,
        child: Consumer<NewsTabViewModel>(
          builder: (context, viewModel,_){
            Widget? currentView ;
            if ( viewModel.isLoading){
              currentView= Loading();
            }
            else if (viewModel.sources.isNotEmpty){
              currentView= buildTabs(viewModel.sources);
            }
            else {
              currentView= ErrorView(errorMessage: viewModel.errorText??"Something went wrong ");
            }
            return currentView;
          },
        ));
  }

  
  Widget buildTabs(List<Source> list ) {
   return  DefaultTabController(
     length: list.length,
     child: Column(
       children: [
         SizedBox(height: 10,),
          TabBar
           (
            onTap: (index){
              currentTabIndex= index;
              setState(() {
              });
            },
            isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: list.map((source) => buildSourceTab(source.name??" ",
                  currentTabIndex==list.indexOf(source)
              )
              ).toList(),


      ),
         SizedBox(height: 8,),
         Expanded(
           child: TabBarView(
               children:
                 list.map((source) => NewsList(sourceId:source.id!)).toList()

           ),
         )
      ]
     ),
   );
  }


  Widget buildSourceTab(String name,bool isSelected) {
    return Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: isSelected? Color(0xff39A552) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border:  Border.all(color: Color(0xff39A552))
      ),

      child: Text(name,
          style:  TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: isSelected? Colors.white : Color(0xff39A552)),


          )
    );
  }
}
