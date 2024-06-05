import 'package:cocktail_flutter_app/cocktail_flutter_app_route.dart';
import 'package:flutter/material.dart';

import 'feature/dashboard/presentation/cocktail_list_page.dart';

class CocktailFlutterApp extends StatefulWidget {
  const CocktailFlutterApp({super.key});

  @override
  State<CocktailFlutterApp> createState() => _CocktailFlutterAppState();
}

class _CocktailFlutterAppState extends State<CocktailFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cocktail Flutter App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CocktailFlutterAppRoute.onGenerateRoute,
      home: const CocktailListPage(),
    );
  }
}
