import 'package:flutter/material.dart';
import '/pages/favorites_page.dart';
import '/pages/categories_page.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages = [];

  @override
  initState() {
    _pages = [
      const CategoriesPage(),
      FavoritePage(
        favoriteMeals: widget.favoriteMeals,
      ),
    ];
    super.initState();
  }

  int _pageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  String get _titleFunc {
    if (_pageIndex == 0) {
      return 'Categories';
    } else {
      return 'Favorites';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleFunc),
      ),
      body: _pages[_pageIndex],
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _pageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorties',
          ),
        ],
      ),
    );
  }
}
