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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, size: 35.0),
          onPressed: () => {
            // Perform Your action here
            Navigator.of(context).pop()
          },
        ),
        toolbarHeight: 70,
        backgroundColor: Colors.purple,
        title: Text(
          'Your Trips',
          style: TextStyle(
              color: Colors.white, fontStyle: FontStyle.normal, fontSize: 40),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListView.builder(
                    itemCount: trips.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Color(0xFFb8ed9a),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Align(
                              child: Text(trips[index].date,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              alignment: Alignment.center,
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              //caixa para ajustar cima em baixo
                              const SizedBox(height: 10.0),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "From: " + trips[index].from,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("To: " + trips[index].to,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Duration: " +
                                          trips[index].time.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("With: " + trips[index].partner,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                              const SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
