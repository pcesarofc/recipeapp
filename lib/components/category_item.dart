import 'package:flutter/material.dart';
import 'package:recipeapp/models/categories.dart';

class CategoryItem extends StatelessWidget {

final Category category;
const CategoryItem(this.category);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category.title),
    );
  }
}