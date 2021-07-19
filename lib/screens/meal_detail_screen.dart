import 'package:flutter/material.dart';
import 'package:recipeapp/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  final bool Function(Meal) isFavorite;
  final Function(Meal) onToggleFavorite;
  const MealDetailScreen(this.onToggleFavorite, this.isFavorite);

  Widget _createTitleRecipe(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createStepsRecipe(Widget child) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
              width: double.infinity,
              height: 300,
            ),
            _createTitleRecipe(context, 'Ingredientes'),
            _createStepsRecipe(
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(
                        meal.ingredients[index],
                      ),
                      color: Colors.amber,
                    );
                  }),
            ),
            _createTitleRecipe(context, 'Passos'),
            _createStepsRecipe(
              ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        const Divider(),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(meal) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
