import 'dart:async';

import 'package:cocktail_flutter_app/cocktail_flutter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const ProviderScope(
      child: CocktailFlutterApp(),
    ));
  }, (error, stackTrace) {
    // Handle error
    debugPrint('Caught error: $error');
    debugPrint('Stack trace: $stackTrace');
  });
}
