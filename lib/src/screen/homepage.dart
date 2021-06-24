import 'package:flutter/material.dart';
import 'package:learning_routes_and_themes/generated/l10n.dart';
import 'package:learning_routes_and_themes/src/data/network.dart';
import 'package:learning_routes_and_themes/src/model/album.dart';
import 'package:learning_routes_and_themes/src/provider/theme_changer.dart';
import 'package:learning_routes_and_themes/src/screen/detail.dart';
import 'package:learning_routes_and_themes/src/screen/product.dart';
import 'package:learning_routes_and_themes/src/util/shared_preferences_helper.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static const String routeName = '/';
  String get kHomeTitle => S.current.homeTitle;
  String get kThemeTitle => S.current.themeTitle;
  String get kHomeNavigationTitle => S.current.homeNavigationTitle;
  String get kThemeNavigationTitle => S.current.settingsNavigationTitle;
  String get kChangeThemeLabel => S.current.changeThemeLabel;
  String get kProductButton => S.current.settingsProductButton;

  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Album>> _albums;
  int _selectedIndex = 0;
  bool _switchValue = SharedPreferencesHelper.isLightTheme;

  @override
  void initState() {
    _albums = Network.getAlbums();
    super.initState();
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getWidgetfor(int index) {
    if (index == 0) {
      return FutureBuilder<List<Album>>(
        future: _albums,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data != null) {
            return ListView.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) => Divider(thickness: 2),
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(data[index].title),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Detail.routeName,
                            arguments: data[index].id);
                      });
                });
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.kChangeThemeLabel),
              SizedBox(
                height: 16,
              ),
              Switch(
                value: _switchValue,
                onChanged: (bool value) {
                  SharedPreferencesHelper.saveThemeState(value);
                  context.read<ThemeChanger>().theme = value;
                  setState(() {
                    _switchValue = value;
                  });
                },
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Product.routeName);
              },
              child: Text(widget.kProductButton))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              _selectedIndex == 0 ? widget.kHomeTitle : widget.kThemeTitle)),
      body: _getWidgetfor(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: widget.kHomeNavigationTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: widget.kThemeNavigationTitle,
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
