import 'package:flutter/material.dart';
import 'package:learning_routes_and_themes/src/data/network.dart';
import 'package:learning_routes_and_themes/src/model/album.dart';
import 'package:learning_routes_and_themes/src/widget/detail_text.dart';

class Detail extends StatefulWidget {
  static const String routeName = '/detail';

  final String kTitle = 'Albums';

  final int id;

  Detail(this.id, {Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<Album> album;

  @override
  void initState() {
    album = Network.getAlbum(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.kTitle)),
      body: FutureBuilder<Album>(
        future: album,
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            return Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  DetailText('USERID', '${data.userId}'),
                  SizedBox(
                    height: 20,
                  ),
                  DetailText('ID', '${data.id}'),
                  SizedBox(
                    height: 20,
                  ),
                  DetailText('TITLE', '${data.title}')
                ]));
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
