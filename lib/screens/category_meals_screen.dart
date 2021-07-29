import 'package:flutter/material.dart';
import '../dummy_dart.dart';

class CategoryMealsScreen extends StatelessWidget {
  //Key for the route from the main.dart also used with pushNamed (Named Routes)
  static const routeName = '/Categories-Meal-Screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments
        as Map<String, String>; // 1st String is 'Key', 2nd one is 'Value'

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
