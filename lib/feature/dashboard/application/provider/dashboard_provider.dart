import 'package:cocktail_flutter_app/feature/dashboard/application/provider/dashboard_provider_container.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/cocktail.dart';

// Import freezed file (maybe not yet generated)
part 'dashboard_provider.freezed.dart';

// Creating state where the freezed annotation will suggest that boilerplate code needs to be generated
@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    List<Cocktail>? cocktailList,
    @Default(false) bool isLoading,
    @Default("") String statusMessage,
  }) = _DashboardState;

  const DashboardState._();
}

final dashboardProvider =
    NotifierProvider<DashboardNotifier, DashboardState>(() {
  return DashboardNotifier();
});

@riverpod
class DashboardNotifier extends Notifier<DashboardState> {
  Future<void> fetchDrinkList(String filterText) async {
    state = state.copyWith(isLoading: true);
    List<Cocktail>? cocktailList =
        await ref.read(dashboardUseCaseProvider).fetchCocktailList(filterText);
    state = state.copyWith(cocktailList: cocktailList);
    state = state.copyWith(isLoading: false);
  }

  @override
  DashboardState build() {
    return const DashboardState();
  }
}
