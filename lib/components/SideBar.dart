import 'package:flutter/material.dart';

Color purple = new Color(0xFF9a33b6);

class SideBar extends StatelessWidget {
  String _AccountName = "Eduardo Nunes";
  String _UCNR = "123456789";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0XFF88e086),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    _AccountName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    _UCNR,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.gps_fixed_rounded,
              color: Colors.black,
            ),
            title: Text('Where am I?',
                style: Theme.of(context).textTheme.headline3),
            onTap: () => Navigator.pushNamed(context, "/YourTrips"),
          ),
          ListTile(
            leading: Icon(
              Icons.directions_car_rounded,
              color: Colors.black,
            ),
            title: Text('Your Trips',
                style: Theme.of(context).textTheme.headline3),
            onTap: () => Navigator.pushNamed(context, "/YourTrips"),
          ),
          ListTile(
            leading: Icon(
              Icons.settings_rounded,
              color: Colors.black,
            ),
            title:
                Text('Settings', style: Theme.of(context).textTheme.headline3),
            onTap: () => Navigator.pushNamed(context, "/Settings"),
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline_rounded,
              color: Colors.black,
            ),
            title: Text('Help', style: Theme.of(context).textTheme.headline3),
            onTap: () => Navigator.pushNamed(context, "/Help"),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title:
                Text('Log Out', style: Theme.of(context).textTheme.headline3),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
