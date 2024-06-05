import 'dart:async';

import 'package:cocktail_flutter_app/cocktail_flutter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(
    child: CocktailFlutterApp(),
  ));
}
