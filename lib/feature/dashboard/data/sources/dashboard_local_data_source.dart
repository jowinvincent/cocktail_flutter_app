import '../model/cocktail.dart';

abstract class DashboardLocalDataSource {
  Future<List<Cocktail>?> fetchCocktailList(String filterText);
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  @override
  Future<List<Cocktail>?> fetchCocktailList(String filterText) {
    // TODO: implement fetchCocktailList
    throw UnimplementedError();
  }
}
