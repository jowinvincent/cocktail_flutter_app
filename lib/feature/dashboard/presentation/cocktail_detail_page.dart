import 'package:cocktail_flutter_app/feature/dashboard/data/model/cocktail.dart';
import 'package:cocktail_flutter_app/feature/dashboard/domain/entity/ingredients.dart';
import 'package:flutter/material.dart';

class CocktailDetailPage extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailDetailPage({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    List<Text> ingredientList =
        Ingredients().getIngredients(cocktail).map((ingredient) {
      if (ingredient.strMeasure != null &&
          ingredient.strIngredientName != null) {}
      return Text(
        '${ingredient.strIngredientName}',
      );
    }).toList();
    List<Text> measureList =
        Ingredients().getIngredients(cocktail).map((ingredient) {
      if (ingredient.strMeasure != null &&
          ingredient.strIngredientName != null) {}
      return Text(
        '${ingredient.strMeasure}',
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail.strDrink ?? ""),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(cocktail.strDrinkThumb ?? ""),
            const SizedBox(height: 16.0),
            Text(
              'Category: ${cocktail.strCategory}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Glass: ${cocktail.strGlass}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Instructions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(cocktail.strInstructions ?? ""),
            const SizedBox(height: 8.0),
            const Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ingredientList,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: measureList,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
