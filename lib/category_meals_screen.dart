import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);
  final String categoryId;
  final String categoryTitle;
  final String categorycontent;

  CategoryMealsScreen(
      this.categoryId, this.categoryTitle, this.categorycontent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(categorycontent == null
            ? 'Waiting for the content'
            : categorycontent),
      ),
    );
  }
}
