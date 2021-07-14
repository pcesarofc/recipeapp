import 'package:flutter/material.dart';
import 'package:recipeapp/models/categories.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category);

  void _selectedCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) {
    //     return CategoriesMealsScreen(category);
    //   }),
    // );

    Navigator.of(context).pushNamed(
      '/category-meals',
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ]),
        ),
      ),
    );
  }
}
