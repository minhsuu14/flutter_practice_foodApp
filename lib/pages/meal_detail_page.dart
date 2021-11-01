import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavortie;
  final Function isFavorite;

  const MealDetailPage(
      {Key? key, required this.toggleFavortie, required this.isFavorite})
      : super(key: key);

  Widget textBuilder(text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final mealDetai = DUMMY_MEALS.firstWhere((meal) => meal.id == routeArgs);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      child: Image.network(
                        mealDetai.imageUrl,
                        fit: BoxFit.fitHeight,
                        height: 200,
                        // height: 100,
                        // width: 100,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        textBuilder('Ingredients'),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          height: 180,
                          child: ListView.builder(
                            itemBuilder: (ctx, index) {
                              return Text(mealDetai.ingredients[index]);
                            },
                            itemCount: mealDetai.ingredients.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            textBuilder('Steps'),
            SizedBox(
              height: 250,
              width: 200,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(mealDetai.steps[index]),
                    ),
                    color: Colors.amber,
                  );
                },
                itemCount: mealDetai.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavortie(routeArgs),
        child: isFavorite()
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }
}
