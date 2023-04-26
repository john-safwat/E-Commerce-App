import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/CategoryShowWidget.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  List<Categories> categories ;
  CategoriesList(this.categories);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryShowWidget(
            image: categories[index].image!,
            name: categories[index].name!),
        itemCount: categories.length,
      ),
    );
  }
}
