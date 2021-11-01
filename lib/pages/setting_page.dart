import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class SettingPage extends StatefulWidget {
  static String routeName = '/setting';
  final Function adjustedMeal;
  final Map<String, bool> currentSetting;
  const SettingPage(
      {Key? key, required this.adjustedMeal, required this.currentSetting})
      : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  Widget _switchListTileBuilder(
    String title,
    String subtitle,
    bool state,
    Function(bool) updateState,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: state,
      onChanged: updateState,
    );
  }

  @override
  initState() {
    _glutenFree = widget.currentSetting['gluten']!;
    _lactoseFree = widget.currentSetting['lactose']!;
    _vegetarian = widget.currentSetting['vegetarian']!;
    _vegan = widget.currentSetting['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> _availableMeal = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.adjustedMeal(_availableMeal);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              'Filter your meals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _switchListTileBuilder(
              'Gluten-Free', 'Only gluten-free meals', _glutenFree, (value) {
            setState(() {
              _glutenFree = value;
            });
          }),
          _switchListTileBuilder(
              'Lactose-Free', 'Only lactose-free meals', _lactoseFree, (value) {
            setState(() {
              _lactoseFree = value;
            });
          }),
          _switchListTileBuilder(
              'Vegetarian', 'Only vegetarian meals', _vegetarian, (value) {
            setState(() {
              _vegetarian = value;
            });
          }),
          _switchListTileBuilder('Vegan', 'Only vegan meals', _vegan, (value) {
            setState(() {
              _vegan = value;
            });
          }),
        ],
      ),
    );
  }
}
