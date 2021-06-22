import 'package:flutter/material.dart';
import 'package:learning_routes_and_themes/src/app.dart';
import 'package:learning_routes_and_themes/src/provider/theme_changer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger())
    ],
    child: RoutesAndThemesApp(),
  ));
}