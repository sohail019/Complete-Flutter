import 'dart:convert';

enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'complexity': complexity.index,
      'affordability': affordability.index,
      'isGlutenFree': isGlutenFree,
      'isLactoseFree': isLactoseFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
    };
  }

  static Meal fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      categories: List<String>.from(json['categories']),
      title: json['title'],
      imageUrl: json['imageUrl'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      duration: json['duration'],
      complexity: Complexity.values[json['complexity']],
      affordability: Affordability.values[json['affordability']],
      isGlutenFree: json['isGlutenFree'],
      isLactoseFree: json['isLactoseFree'],
      isVegan: json['isVegan'],
      isVegetarian: json['isVegetarian'],
    );
  }

  // Convert a list of Meal objects into a JSON-encoded string
  String encode(List<Meal> meals) => json.encode(
    meals.map<Map<String, dynamic>>((meal) => meal.toJson()).toList(),
  );

  // Convert a JSON string back into a list of Meal objects
  List<Meal> decode(String meals) {
    final List<dynamic> parsed = json.decode(meals);
    return parsed.map<Meal>((json) => Meal.fromJson(json)).toList();
  }
}
