import 'package:cocktail_flutter_app/feature/dashboard/data/model/cocktail.dart';

import '../domain/repository/dashboard_repository.dart';
import 'dashboard_usecase.dart';

class DashboardLogic implements DashboardUseCase {
  final DashboardRepository repository;
  DashboardLogic(this.repository);

  @override
  Future<List<Cocktail>?> fetchCocktailList(String filterText) async {
    final List<Cocktail>? cocktailList =
        await repository.fetchCocktailList(filterText);
    return cocktailList;
  }
}
