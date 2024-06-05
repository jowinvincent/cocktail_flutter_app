import 'package:cocktail_flutter_app/network/api_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/dashboard_repository_impl.dart';
import '../../data/sources/dashboard_local_data_source.dart';
import '../../data/sources/dashboard_remote_data_source.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../dashboard_logic.dart';

final localDataSourceRepoProvider = Provider<DashboardLocalDataSource>(
  (ref) => DashboardLocalDataSourceImpl(),
);

// Remote Data Source Provider with API Instance
final remoteDataSourceRepoProvider = Provider<DashboardRemoteDataSource>((ref) {
  final apiService = ref.read(apiServiceDioProvider);
  return DashboardRemoteDataSourceImpl(apiService);
});

// Dashboard Repository provider with local & remote data source
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final localService = ref.read(localDataSourceRepoProvider);
  final remoteService = ref.read(remoteDataSourceRepoProvider);
  return DashboardRepositoryImpl(localService, remoteService);
});

// Dashboard Logic provider with repository
final dashboardUseCaseProvider = Provider<DashboardLogic>((ref) {
  final dashboardRepository = ref.read(dashboardRepositoryProvider);
  return DashboardLogic(dashboardRepository);
});
