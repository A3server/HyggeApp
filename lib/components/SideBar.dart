import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:HyggeApp/components/RequestAssistant.dart';

//Setting state
class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late Future<LOCATIONS> futureLOCATION;

  // ignore: non_constant_identifier_names
  String AccountName = "placeholder";

  // ignore: non_constant_identifier_names
  String PHONENR = "placeholder";

  void initState() {
    // TODO: implement initState
    super.initState();
    readandsetlsvalues();

    futureLOCATION = RequestAssistant.fetchLOCATION();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFbef79e),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 290,
              child: Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(
                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage("https://ssbworld.com/images/character-profiles/rounded/Jigglypuff-Profile-Round.png"),
                              radius: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[ Text(
                                '$AccountName',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w800, color: Colors.black
                                ),
                              ),
                              Text(
                                '$PHONENR',
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              ]),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Divider(
              height: 0,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              height: 100,
              child: ListTile(
                leading: Container(
                  height: 100,
                  child: Icon(Icons.location_on, color: Colors.black),
                ),
                title: Center(
                  child: FutureBuilder<LOCATIONS>(
                    future: futureLOCATION,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        String show = snapshot.data!.ADDRS;
                        List addrsplit = show.split(",");
                        String toshow = addrsplit[0] + ", " + addrsplit[2];
                        return Text(toshow,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline3);
                      } else if (snapshot.hasError) {
                        print("${snapshot.error}");
                        return Text("Não encontrado! :(",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline3);
                      }
                      // show a loading spinner.
                        return LinearProgressIndicator();
                    },
                  )
                ),
              ),
            ),
            Container(
              height: 80,
              child: ListTile(
                leading: Icon(
                    Icons.directions_car_rounded,
                    color: Colors.black,
                  ),
                title: Text('Your Trips',
                    style: Theme.of(context).textTheme.headline3),
                onTap: () => Navigator.pushNamed(context, "/YourTrips"),
              ),
            ),
            Container(
              height: 70,
              child: ListTile(
                leading: Icon(
                  Icons.settings_rounded,
                  color: Colors.black,
                ),
                title:
                    Text('Settings', style: Theme.of(context).textTheme.headline3),
                onTap: () => Navigator.pushNamed(context, "/Settings"),
              ),
            ),
            Divider(
              height: 30,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              height: 80,
              child: ListTile(
                leading: Icon(
                  Icons.help_outline_rounded,
                  color: Colors.black,
                ),
                title: Text('Help', style: Theme.of(context).textTheme.headline3),
                onTap: () => Navigator.pushNamed(context, "/Help"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  readandsetlsvalues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      AccountName = (prefs.getString('UserName') ?? 0).toString();
      PHONENR = (prefs.getString('UserPhone') ?? 0).toString();
    });
  }
}

