import 'package:cocktail_flutter_app/feature/dashboard/data/model/cocktail.dart';

class Ingredients {
  String? strIngredientName;
  String? strMeasure;

  Ingredients({this.strIngredientName, this.strMeasure});

  List<Ingredients> getIngredients(Cocktail cocktail) {
    List<Ingredients> ingredients = [];
    for (int i = 1; i <= 15; i++) {
      String? ingredient = _getProperty('strIngredient$i', cocktail);
      String? measure = _getProperty('strMeasure$i', cocktail);
      if (ingredient != null && measure != null) {
        ingredients.add(
            Ingredients(strIngredientName: ingredient, strMeasure: measure));
      }
    }
    return ingredients;
  }

  String? _getProperty(String key, Cocktail cocktail) {
    switch (key) {
      case 'strIngredient1':
        return cocktail.strIngredient1;
      case 'strIngredient2':
        return cocktail.strIngredient2;
      case 'strIngredient3':
        return cocktail.strIngredient3;
      case 'strIngredient4':
        return cocktail.strIngredient4;
      case 'strIngredient5':
        return cocktail.strIngredient5;
      case 'strIngredient6':
        return cocktail.strIngredient6;
      case 'strIngredient7':
        return cocktail.strIngredient7;
      case 'strIngredient8':
        return cocktail.strIngredient8;
      case 'strIngredient9':
        return cocktail.strIngredient9;
      case 'strIngredient10':
        return cocktail.strIngredient10;
      case 'strIngredient11':
        return cocktail.strIngredient11;
      case 'strIngredient12':
        return cocktail.strIngredient12;
      case 'strIngredient13':
        return cocktail.strIngredient13;
      case 'strIngredient14':
        return cocktail.strIngredient14;
      case 'strIngredient15':
        return cocktail.strIngredient15;
      case 'strMeasure1':
        return cocktail.strMeasure1;
      case 'strMeasure2':
        return cocktail.strMeasure2;
      case 'strMeasure3':
        return cocktail.strMeasure3;
      case 'strMeasure4':
        return cocktail.strMeasure4;
      case 'strMeasure5':
        return cocktail.strMeasure5;
      case 'strMeasure6':
        return cocktail.strMeasure6;
      case 'strMeasure7':
        return cocktail.strMeasure7;
      case 'strMeasure8':
        return cocktail.strMeasure8;
      case 'strMeasure9':
        return cocktail.strMeasure9;
      case 'strMeasure10':
        return cocktail.strMeasure10;
      case 'strMeasure11':
        return cocktail.strMeasure11;
      case 'strMeasure12':
        return cocktail.strMeasure12;
      case 'strMeasure13':
        return cocktail.strMeasure13;
      case 'strMeasure14':
        return cocktail.strMeasure14;
      case 'strMeasure15':
        return cocktail.strMeasure15;
      default:
        return null;
    }
  }
}
