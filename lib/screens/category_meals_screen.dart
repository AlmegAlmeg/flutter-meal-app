import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle = '';
  List<Meal> displayedMeals = [];
  var _loadedInitDate = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitDate) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((item) {
        return item.categories.contains(categoryId);
      }).toList();
      _loadedInitDate = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var cmi = displayedMeals[index];
          return MealItem(
            id: cmi.id,
            title: cmi.title,
            imageUrl: cmi.imageUrl,
            duration: cmi.duration,
            complexity: cmi.complexity,
            affordability: cmi.affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
