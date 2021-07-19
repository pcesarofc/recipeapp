import 'package:flutter/material.dart';
import 'categories_screens.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meals.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  late List<Map<String, Widget>> _screens;
  
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': const Text('Lista de Categorias'),
        'screen': const CategoriesScreen(),
      },
      {
        'title': const Text('Lista de Favoritos'),
        'screen': FavoriteScreen(widget.favoriteMeals),
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _screens[_selectedIndex]['title'],
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
