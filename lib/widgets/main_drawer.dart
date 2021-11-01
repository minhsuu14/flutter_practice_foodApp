import 'package:flutter/material.dart';
import '../pages/setting_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget listTileBuilder(String title, IconData icon, Function() onTapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          listTileBuilder(
            'Meals',
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/home'),
          ),
          listTileBuilder(
            'Setting',
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(SettingPage.routeName),
          ),
        ],
      ),
    );
  }
}
