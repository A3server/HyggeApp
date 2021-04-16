import 'dart:math';
import 'package:flutter/material.dart';
import 'package:a3team/sidebar/SideBarLayout.dart';
import 'package:flutter/rendering.dart';

String getRandomImage() {
  List<String> image2show = ['static/images/polo1.jpg', 'static/images/polo2.jpg','static/images/polo3.jpg'];
  final random = new Random();
  var i = random.nextInt(image2show.length);

  return image2show[i];
}


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 5.0,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 390.0,

            leading: GestureDetector(
              onTap: () { },
              child: Icon(
                Icons.menu,  // add custom icons also
                size: 30,
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                fit: BoxFit.cover,
                image:
                AssetImage(getRandomImage()),
              ),
            ),
          ),
          SliverList(
            //Depois escrevemos aqui o conteudo de baixo.
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}