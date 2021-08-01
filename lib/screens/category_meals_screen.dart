import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/Categories-Meal-Screen';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  String categoryId;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  // @override
  // void initState() {
  //   super.initState();
  // }

//Here we are use didChangeDependencies() instead of initState(), because here we are using " ModalRoute.of(context)... " that is now liked by initState(),
//i.e ModalRoute taps into behind scenes context setup with the inherited widget. Here this does not work because context generally is globally available in our state object
//but not inside of initState because initState runs too early, it runs before our widget has been created or fully created and before we have a context for our widget.
//So in initState we can't retrieve the route data unfortunately. So as a solution we are using didChangeDependencies().

//here didChangeDependencies() will be triggered essentially whenever the references of the state change.
//mean it will be called when the widget that belongs to the satte has been fully initialized and we can tap into context.
//It will still run before build runs.

//Here we can use initState(), if we wouldn't have required to use mdoel route of context in here.

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments
          as Map<String, String>; // 1st String is 'Key', 2nd one is 'Value'

      categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(
      () {
        displayedMeals.removeWhere((meal) => meal.id == mealId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: displayedMeals.isEmpty
          ? Center(
              child: Text('No content available'),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  id: displayedMeals[index].id,
                  title: displayedMeals[index].title,
                  imageUrl: displayedMeals[index].imageUrl,
                  duration: displayedMeals[index].duration,
                  affordability: displayedMeals[index].affordability,
                  complexity: displayedMeals[index].complexity,
                );
              },
              itemCount: displayedMeals.length,
            ),
    );
  }
}
