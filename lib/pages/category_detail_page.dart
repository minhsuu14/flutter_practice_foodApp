import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryDetailPage extends StatefulWidget {
  static const routeName = '/category-detail';
  final List<Meal> availableMeals;
  const CategoryDetailPage({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id']!;
    final categoryMeal = widget.availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeal[index].id,
              imageUrl: categoryMeal[index].imageUrl,
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              title: categoryMeal[index].title,
              duration: categoryMeal[index].duration);
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
