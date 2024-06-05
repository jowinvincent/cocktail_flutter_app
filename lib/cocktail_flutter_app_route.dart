import 'package:cocktail_flutter_app/feature/dashboard/data/model/cocktail.dart';
import 'package:cocktail_flutter_app/feature/dashboard/presentation/cocktail_detail_page.dart';
import 'package:flutter/material.dart';

class CocktailFlutterAppRoute {
  static const String cocktailListPage = "COCKTAIL_LIST_PAGE";
  static const String cocktailDetailPage = "COCKTAIL_DETAIL_PAGE";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cocktailDetailPage:
        Map<dynamic, dynamic>? map =
            settings.arguments as Map<dynamic, dynamic>?;
        Cocktail cocktail = map?['cocktail'];
        return MaterialPageRoute(
          builder: (_) => CocktailDetailPage(
            cocktail: cocktail,
          ),
        );
      default:
        return defaultRoute(settings);
    }
  }

  static MaterialPageRoute<dynamic> defaultRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Page not found：${settings.name}'),
        ),
      ),
    );
  }
}
