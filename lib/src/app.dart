import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_routes_and_themes/generated/l10n.dart';
import 'package:learning_routes_and_themes/src/provider/theme_changer.dart';
import 'package:learning_routes_and_themes/src/screen/detail.dart';
import 'package:learning_routes_and_themes/src/screen/homepage.dart';
import 'package:learning_routes_and_themes/src/screen/product.dart';
import 'package:learning_routes_and_themes/src/screen/shopping_cart.dart';
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
          case ShoppingCart.routeName:
            return MaterialPageRoute(builder: (context) {
              return ShoppingCart();
            });
        }
      },
    );
  }

  ThemeData _getThemeData(BuildContext context) {
    final isLight = context.watch<ThemeChanger>().isLight;
    final theme = isLight
        ? ThemeData.light().copyWith(
            primaryColor: Color.fromRGBO(68, 83, 226, 1),
          )
        : ThemeData.dark();
    return theme.copyWith(
        textTheme:
            theme.textTheme.apply(fontFamily: GoogleFonts.lora().fontFamily),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color.fromRGBO(68, 83, 226, 1)
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(68, 83, 226, 1)))));
  }
}
