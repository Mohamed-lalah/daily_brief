import 'package:daily_brief/model/category_model.dart';
import 'package:daily_brief/ui/screens/home/tabs/categories/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key,required this.categoryClick});

  final Function(CategoryDm) categoryClick ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height*0.02,),
      Text("Pick up Your  Category ", style: GoogleFonts.poppins(
        color: Color(0xff4F5A69),
        fontWeight: FontWeight.bold,
        fontSize: 22
      ),),
      SizedBox(height: height*0.02,),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount:  CategoryDm.dmList.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 18
              ),

              itemBuilder: (context, int )=>InkWell(
                  onTap: (){
                     categoryClick(CategoryDm.dmList[int]);
                  },
                  child: CategoryWidget(  categoryDm:  CategoryDm.dmList[int],))),
        ),
      )
      ],
    );
  }
}
