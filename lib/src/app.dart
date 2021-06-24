import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_routes_and_themes/generated/l10n.dart';
import 'package:learning_routes_and_themes/src/provider/theme_changer.dart';
import 'package:learning_routes_and_themes/src/screen/detail.dart';
import 'package:learning_routes_and_themes/src/screen/homepage.dart';
import 'package:learning_routes_and_themes/src/screen/product.dart';
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
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: _getThemeData(context),
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
          case Product.routeName:
            return MaterialPageRoute(builder: (context) {
              return Product();
            });
        }
      },
    );
  }

  ThemeData _getThemeData(BuildContext context) {
    final isLight = context.watch<ThemeChanger>().isLight;
    final theme = isLight ? ThemeData.light() : ThemeData.dark();
    return theme.copyWith(
        textTheme:
            theme.textTheme.apply(fontFamily: GoogleFonts.lora().fontFamily));
  }
}
