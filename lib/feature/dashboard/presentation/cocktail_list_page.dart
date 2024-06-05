import 'package:cocktail_flutter_app/cocktail_flutter_app_route.dart';
import 'package:cocktail_flutter_app/feature/dashboard/application/provider/dashboard_provider.dart';
import 'package:cocktail_flutter_app/util/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/debouncer.dart';

class CocktailListPage extends ConsumerStatefulWidget {
  const CocktailListPage({super.key});

  @override
  ConsumerState<CocktailListPage> createState() => _CocktailListPageState();
}

class _CocktailListPageState extends ConsumerState<CocktailListPage> {
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    // Fetch the initial list of cocktails after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardProvider.notifier).fetchDrinkList("");
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drinks'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for drinks...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _searchController.clear();
                    ref.read(dashboardProvider.notifier).fetchDrinkList("");
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                _debouncer.run(() {
                  ref
                      .read(dashboardProvider.notifier)
                      .fetchDrinkList(value.toLowerCase());
                });
              },
            ),
          ),
        ),
      ),
      body: dashboardState.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : dashboardState.cocktailList != null &&
                  dashboardState.cocktailList!.isNotEmpty
              ? ListView.builder(
                  itemCount: dashboardState.cocktailList!.length,
                  itemBuilder: (context, index) {
                    final cocktail = dashboardState.cocktailList![index];
                    return ListTile(
                      leading: Image.network(cocktail.strDrinkThumb ?? ""),
                      title: Text(cocktail.strDrink ?? ""),
                      subtitle: Text(cocktail.strCategory ?? ""),
                      onTap: () => Navigator.pushNamed(
                        context,
                        CocktailFlutterAppRoute.cocktailDetailPage,
                        arguments: {'cocktail': cocktail},
                      ),
                    );
                  },
                )
              : const Center(child: Text(StringConstant.noResult)),
    );
  }
}
