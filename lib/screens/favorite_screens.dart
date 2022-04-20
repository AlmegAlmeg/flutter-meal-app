import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet...'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var cmi = favoriteMeals[index];
          return MealItem(
            id: cmi.id,
            title: cmi.title,
            imageUrl: cmi.imageUrl,
            duration: cmi.duration,
            complexity: cmi.complexity,
            affordability: cmi.affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
