import 'package:flutter/material.dart';
import 'package:learning_routes_and_themes/src/app.dart';
import 'package:learning_routes_and_themes/src/provider/theme_changer.dart';
import 'package:learning_routes_and_themes/src/util/shared_preferences_helper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: SharedPreferencesHelper.getThemeState(),
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (data != null) {
          SharedPreferencesHelper.isLightTheme = data;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (_) =>
                      ThemeChanger(SharedPreferencesHelper.isLightTheme))
            ],
            child: RoutesAndThemesApp(),
          );
        } else if (snapshot.hasError) {
          throw Exception('Could not load SharedPreferences!');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
