import 'package:_04_get_meals_app/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder:
                    (ctx, index) => Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Text(meal.ingredients[index]),
                      ),
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Steps', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder:
                    (ctx, index) => Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Text(meal.steps[index]),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
