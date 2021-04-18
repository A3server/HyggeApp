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
      backgroundColor: Colors.grey.shade100,
      key: _scaffoldKey,
      drawer: SideBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            collapsedHeight: 100,
            expandedHeight: 30,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: Text(''),
            ),
            actions: <Widget>[
              SizedBox(
                width: 100,
                height: 200,
                child: IconButton(
                  icon: Image.asset(
                    "static/hyhyge21.png",
                    height: 200,
                    width: 200,
                  ),
                  onPressed: () => {
                  },
                ),
              ),
            ],
            pinned: _pinned,
            floating: _floating,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: 15,
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        iconSize: 40,
                        color: Colors.white,
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Hygge",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontFamily: 'Poppins-Bold'),
                            ),
                            /*Padding(
                              padding: const EdgeInsets.only(top:0.0),

                              child: SizedBox(
                                width: 250,
                                height: 40,
                                child: ClipRRect(
                                  borderRadius:BorderRadius.circular(10),
                                  child: Container(
                                    child: Text(
                                        "Search",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.w100, color: Colors.grey),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(width: 4.0,color: Colors.grey),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                  ),
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.grey.shade100,
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "FAVOURITES",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9a33b6),
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0, top: 0),
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
                child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(
                    context,
                    "/TripStart",
                    arguments: TripARGS(
                        favouriteLocations[index].nome,
                        favouriteLocations[index]
                            .Localizacao), //passing the name and the POS
                  );
                });
              },
              child: ListTile(
                title: Text(favouriteLocations[index].nome),
                leading: Icon(
                  Icons.star,
                  color: Colors.black,
                ),
              ),
            ));
          }, childCount: favouriteLocations.length)),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.grey.shade100,
                child: Center(
                  child: Text(
                    "FEATURED",
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
                color: Colors.grey.shade100,
                child: Center(
                  child: Text(
                    "LATEST",
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
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(
                      context,
                      "/TripStart",
                      arguments: TripARGS(
                          latestLocations[index].nome,
                          latestLocations[index]
                              .Localizacao), //passing the name and the POS
                    );
                  });
                },
                child: ListTile(
                  title: Text(latestLocations[index].nome),
                  leading: Icon(
                    Icons.access_time,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }, childCount: latestLocations.length)),
        ],
      ),
    );
  }
}
