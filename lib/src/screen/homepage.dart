import 'package:flutter/material.dart';
import 'package:learning_routes_and_themes/src/data/network.dart';
import 'package:learning_routes_and_themes/src/model/album.dart';
import 'package:learning_routes_and_themes/src/provider/theme_changer.dart';
import 'package:learning_routes_and_themes/src/screen/detail.dart';
import 'package:learning_routes_and_themes/src/util/shared_preferences_helper.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static const String routeName = '/';
  final String kTitle = 'Albums';

  const Homepage({Key? key}) : super(key: key);

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
            return ListView.builder(
                itemCount: data.length * 2,
                itemBuilder: (context, index) {
                  if (index.isOdd)
                    return Divider(
                      thickness: 2,
                    );
                  return ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(data[index ~/ 2].title),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Detail.routeName,
                            arguments: data[index ~/ 2].id);
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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CHANGE THEME'),
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.kTitle)),
      body: _getWidgetfor(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Theme',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
