import 'package:flutter/material.dart';
import 'package:recipeapp/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
            width: double.infinity,
            height: 300,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              meal.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(
                      meal.ingredients[index],
                    ),
                    color: Colors.amber,
                  );
                }),
          )
        ],
      ),
    );
  }
}
