import 'package:daily_brief/model/category_model.dart';
import 'package:daily_brief/ui/screens/home/tabs/categories/category_widget.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Text("Pick up Your  Category "),
      SizedBox(height: 15,),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount:  CategoryDm.dmList.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 22
              ),

              itemBuilder: (context, int )=>CategoryWidget(  categoryDm:  CategoryDm.dmList[int],)),
        ),
      )
      ],
    );
  }
}
