import 'package:cocktail_flutter_app/feature/dashboard/data/model/cocktail.dart';

abstract class DashboardRepository {
  Future<List<Cocktail>?> fetchCocktailList(String filterText);
}
