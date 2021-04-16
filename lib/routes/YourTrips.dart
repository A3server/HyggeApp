import 'package:flutter/material.dart';

class Trip {
  int id;
  String date;
  String from;
  String to;
  double time; // in seconds
  String partner; //later will be a class User with user details

  Trip(this.id, this.date, this.from, this.to, this.time, this.partner);
}

class YourTrips extends StatefulWidget {
  @override
  _YourTripsState createState() => _YourTripsState();
}

class _YourTripsState extends State<YourTrips> {
  List<Trip> trips = [
    Trip(64566221, "16/04/2021", "Casa", "Polo I", 21742.42, "Maria"),
    Trip(64566246, "15/04/2021", "Polo I", "Casa", 2121.79, "Patricio"),
    Trip(64566264, "15/04/2021", "Casa", "Polo III", 41245.03, "Nuno"),
    Trip(64566221, "14/04/2021", "Casa", "Polo I", 21742.42, "Maria"),
    Trip(64566246, "01/04/2021", "Polo I", "Casa", 2121.79, "Patricio"),
    Trip(64566264, "20/03/2021", "Casa", "Polo III", 41245.03, "Nuno"),
    Trip(64566221, "16/03/2021", "Casa", "Polo I", 21742.42, "Maria"),
    Trip(64566246, "12/03/2021", "Polo I", "Casa", 2121.79, "Patricio"),
    Trip(64566264, "28/02/2021", "Casa", "Polo III", 41245.03, "Nuno"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9a33b6),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Trips",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        iconSize: 37,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: trips.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xFFb8ed9a),
                  child: ListTile(
                    title: Align(
                      child: Text(trips[index].date),
                      alignment: Alignment.center,
                    ),
                    subtitle: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "From: " + trips[index].from,
                              style: TextStyle(color: Colors.black),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("To: " + trips[index].to,
                                style: TextStyle(color: Colors.black))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Duration: " + trips[index].time.toString(),
                                style: TextStyle(color: Colors.black))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("With: " + trips[index].partner,
                                style: TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
