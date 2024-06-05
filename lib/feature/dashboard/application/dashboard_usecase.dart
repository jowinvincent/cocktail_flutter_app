import '../data/model/cocktail.dart';

abstract class DashboardUseCase {
  Future<List<Cocktail>?> fetchCocktailList(String filterText);
}
