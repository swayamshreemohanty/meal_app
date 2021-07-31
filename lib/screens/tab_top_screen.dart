import 'package:flutter/material.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsTopScreenState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        // initialIndex: 1, //is used to start the app with the selected Tab from the tab bar
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.category,
                  ),
                  text: 'Categoris',
                ),
                Tab(
                  icon: Icon(
                    Icons.star,
                  ),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CategoriesScreen(),
              FavoriteScreen(),
            ],
          ),
        ));
  }
}
