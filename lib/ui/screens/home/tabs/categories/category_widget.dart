import 'package:daily_brief/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryDm categoryDm;
  final Radius borderRadius = const Radius.circular(16);
  const CategoryWidget({super.key, required this.categoryDm});

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       color: categoryDm.backGroundColor,
       borderRadius: BorderRadius.only(
         topLeft: borderRadius,
         topRight: borderRadius,
         bottomLeft: categoryDm.isLeftSide ? Radius.zero : borderRadius,
         bottomRight: !categoryDm.isLeftSide ? Radius.zero : borderRadius
       )
     ),
      child: Column(
        children: [
          Image.asset(categoryDm.imagePath,height: MediaQuery.of(context).size.height*0.17,),
          Text(categoryDm.title,style: GoogleFonts.exo(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.normal
          ),),

        ],
      ),
    );
  }
}
