import 'package:flutter/material.dart';
import 'package:learning_routes_and_themes/src/provider/theme_changer.dart';
import 'package:learning_routes_and_themes/src/screen/detail.dart';
import 'package:learning_routes_and_themes/src/screen/homepage.dart';
import 'package:provider/provider.dart';

class RoutesAndThemesApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  RoutesAndThemesAppState createState() => RoutesAndThemesAppState();
}

class RoutesAndThemesAppState extends State<RoutesAndThemesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeChanger>().isLight ? ThemeData.light() : ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Homepage.routeName:
            return MaterialPageRoute(builder: (context) {
              return Homepage();
            });
          case Detail.routeName:
            final id = settings.arguments as int;
            return MaterialPageRoute(builder: (context) {
              return Detail(id);
            });
        }
      },
    );
  }
}
