import 'package:cocktail_flutter_app/feature/dashboard/data/model/cocktail_data_response.dart';

import '../../../../core/network/api_service_provider.dart';
import '../model/cocktail.dart';

abstract class DashboardRemoteDataSource {
  Future<List<Cocktail>?> fetchCocktailList(String filterText);
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final ApiServiceDio apiServiceDio;

  DashboardRemoteDataSourceImpl(this.apiServiceDio);

  @override
  Future<List<Cocktail>?> fetchCocktailList(String filterText) async {
    final response = await apiServiceDio
        .get('/api/json/v1/1/search.php', queryParameters: {r's': filterText});
    final List<Cocktail>? cocktailList =
        CocktailDataResponse.fromJson(response.data).drinks;

    return cocktailList;
  }
}
