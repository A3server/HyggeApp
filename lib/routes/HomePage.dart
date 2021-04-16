import 'package:flutter/material.dart';
import 'package:HyggeApp/components/SideBar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {


  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  int favcount = 1;
  //GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      drawer: SideBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 280,
            pinned: _pinned,
            floating: _floating,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hygge",
              style: TextStyle(color: Colors.white, fontSize: 35),
              ),

            ),
          ),
          SliverFixedExtentList(
            itemExtent: 150,
            //Depois escrevemos aqui o conteudo de baixo.
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Favourites",
                    style: TextStyle(color: Color(0xFF9a33b6), fontSize: 30),
                  ),
                ),
              );
              },childCount: favcount,
            ),
          ),
        ],
      ),
    );
  }
}
