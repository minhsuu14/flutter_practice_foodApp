import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: DUMMY_CATEGORIES
          .map(
            (cate) => CategoryItem(
              id: cate.id,
              title: cate.title,
              color: cate.color,
            ),
          )
          .toList(),
    );
  }
}
