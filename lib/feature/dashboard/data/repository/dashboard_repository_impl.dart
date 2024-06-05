import '../model/cocktail.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../sources/dashboard_local_data_source.dart';
import '../sources/dashboard_remote_data_source.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource localDataSource;
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<List<Cocktail>?> fetchCocktailList(String filterText) async {
    final cocktailList = await remoteDataSource.fetchCocktailList(filterText);
    return cocktailList;
  }
}
