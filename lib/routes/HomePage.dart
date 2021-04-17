import 'package:flutter/material.dart';
import 'package:HyggeApp/components/SideBar.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class TripARGS {
  late final String Nameofloc;
  late final Position location;

  TripARGS(this.Nameofloc, this.location);
}

class Location {
  final String nome;
  final Position Localizacao;

  Location({required this.nome, required this.Localizacao});
}

class _MyHomePageState extends State<HomePage> {
  bool _pinned = true;
  bool _floating = false;

  late Position setLOCATION;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    DateTime currentTIME = DateTime.now();
    //Posições mais importantes:
    Position ChangePOSHOME = new Position(
        longitude: 40.20946688830309,
        latitude: -8.423152261497428,
        timestamp: currentTIME,
        accuracy: 20.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0);

    Position ChangePOSSHOP = new Position(
        longitude: 40.20946688830309,
        latitude: -8.423152261497428,
        timestamp: currentTIME,
        accuracy: 20.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0);

    List<Location> favouriteLocations = [
      Location(nome: "Casa", Localizacao: ChangePOSHOME),
      Location(nome: "Shopping", Localizacao: ChangePOSSHOP),
    ];

    List<Location> featuredLocations = [
      Location(
          nome: "Polo I",
          Localizacao: new Position(
              longitude: 40.20946688830309,
              latitude: -8.423152261497428,
              timestamp: currentTIME,
              accuracy: 20.0,
              altitude: 0.0,
              heading: 0.0,
              speed: 0.0,
              speedAccuracy: 0.0)),
      Location(
          nome: "Polo II",
          Localizacao: new Position(
              longitude: 40.18634692664819,
              latitude: -8.41224261890603,
              timestamp: currentTIME,
              accuracy: 20.0,
              altitude: 0.0,
              heading: 0.0,
              speed: 0.0,
              speedAccuracy: 0.0)),
      Location(
          nome: "Polo III",
          Localizacao: new Position(
              longitude: 40.2179634941954,
              latitude: -8.416041322090948,
              timestamp: currentTIME,
              accuracy: 20.0,
              altitude: 0.0,
              heading: 0.0,
              speed: 0.0,
              speedAccuracy: 0.0))
    ];

    List<Location> latestLocations = [
      Location(
          nome: "Polo II",
          Localizacao: new Position(
              longitude: 40.18634692664819,
              latitude: -8.41224261890603,
              timestamp: currentTIME,
              accuracy: 20.0,
              altitude: 0.0,
              heading: 0.0,
              speed: 0.0,
              speedAccuracy: 0.0)),
      Location(
          nome: "Rua Hygge",
          Localizacao: new Position(
              longitude: 40.18634692664819,
              latitude: -8.41224261890603,
              timestamp: currentTIME,
              accuracy: 20.0,
              altitude: 0.0,
              heading: 0.0,
              speed: 0.0,
              speedAccuracy: 0.0)),
      Location(
          nome: "Casa",
          Localizacao: new Position(
              longitude: 40.18634692664819,
              latitude: -8.41224261890603,
              timestamp: currentTIME,
              accuracy: 20.0,
              altitude: 0.0,
              heading: 0.0,
              speed: 0.0,
              speedAccuracy: 0.0)),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            collapsedHeight: 70,
            expandedHeight: 100,
            pinned: _pinned,
            floating: _floating,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SafeArea(
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hygge",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        iconSize: 37,
                        color: Colors.white,
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Favourites",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9a33b6),
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "ADD",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xFF9a33b6),
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Card(
                child: ListTile(
              title: Text(favouriteLocations[index].nome),
              leading: Icon(
                Icons.star,
                color: Colors.black,
              ),
            ));
          }, childCount: favouriteLocations.length)),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Featured",
                    style: TextStyle(color: Color(0xFF9a33b6), fontSize: 30),
                  ),
                ),
              ),
            ]),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Card(
                //featured
                child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(
                    context,
                    "/TripStart",
                    arguments: TripARGS(
                        featuredLocations[index].nome,
                        featuredLocations[index]
                            .Localizacao), //passing the name and the POS
                  );
                });
              },
              child: ListTile(
                title: Text(featuredLocations[index].nome),
                leading: Icon(
                  Icons.school,
                  color: Colors.black,
                ),
              ),
            ));
          }, childCount: featuredLocations.length)),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Latest",
                    style: TextStyle(color: Color(0xFF9a33b6), fontSize: 30),
                  ),
                ),
              ),
            ]),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Card(
                child: GestureDetector(
              onTap: () {},
              child: ListTile(
                title: Text(latestLocations[index].nome),
                leading: Icon(
                  Icons.access_time,
                  color: Colors.black,
                ),
              ),
            ));
          }, childCount: latestLocations.length)),
        ],
      ),
    );
  }
}
