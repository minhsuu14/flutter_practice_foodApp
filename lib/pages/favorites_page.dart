import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritePage({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteMeals.isEmpty
          ? const Text('No favorite food yet, add some !')
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                    id: favoriteMeals[index].id,
                    imageUrl: favoriteMeals[index].imageUrl,
                    affordability: favoriteMeals[index].affordability,
                    complexity: favoriteMeals[index].complexity,
                    title: favoriteMeals[index].title,
                    duration: favoriteMeals[index].duration);
              },
              itemCount: favoriteMeals.length,
            ),
    );
  }
}
