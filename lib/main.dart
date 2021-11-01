import 'package:flutter/material.dart';
import '/pages/tab_screen.dart';
import 'pages/category_detail_page.dart';
import './dummy_data.dart';
import 'pages/meal_detail_page.dart';
import 'pages/setting_page.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filterMeal = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> newMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  @override
  Widget build(BuildContext context) {
    void _filteredMeal(Map<String, bool> availableMeal) {
      setState(() {
        _filterMeal = availableMeal;

        newMeals = DUMMY_MEALS.where((meal) {
          if (_filterMeal['gluten']! && !meal.isGlutenFree) {
            return false;
          }
          if (_filterMeal['lactose']! && !meal.isLactoseFree) {
            return false;
          }
          if (_filterMeal['vegetarian']! && !meal.isVegetarian) {
            return false;
          }
          if (_filterMeal['vegan']! && !meal.isVegan) {
            return false;
          }
          return true;
        }).toList();
      });
    }

    void _toggleFavorite(String id) {
      final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == id);
      if (existingIndex >= 0) {
        setState(() {
          favoriteMeals.removeAt(existingIndex);
        });
      } else {
        setState(() {
          favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
        });
      }
    }

    bool isFavorite(String id) {
      if (favoriteMeals.any((meal) => meal.id == id)) {
        return true;
      } else {
        return false;
      }
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: TabScreen(
        favoriteMeals: favoriteMeals,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (ctx) => TabScreen(
              favoriteMeals: favoriteMeals,
            ),
        CategoryDetailPage.routeName: (ctx) => CategoryDetailPage(
              availableMeals: newMeals,
            ),
        MealDetailPage.routeName: (ctx) => MealDetailPage(
              toggleFavortie: _toggleFavorite,
              isFavorite: isFavorite,
            ),
        SettingPage.routeName: (ctx) => SettingPage(
              adjustedMeal: _filteredMeal,
              currentSetting: _filterMeal,
            ),
      },
    );
  }
}
