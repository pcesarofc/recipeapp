enum Complexity{
  Simple,
  Medium,
  Difficult,
}

enum Cost{
  Cheap,
  Fair,
  Expensive,
}

class Meal {
  final String title;
  final String id;
  final List<String> categories;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Cost cost;

  Meal({
    required this.title,
    required this.id,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.steps,
    required this.duration,
    required this.imageUrl,
    required this.ingredients,
    required this.categories,
    required this.complexity,
    required this.cost, 
    
  });
}
