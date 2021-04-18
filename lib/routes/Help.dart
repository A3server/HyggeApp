import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);
  @override
  Helpstat createState() => Helpstat();
}

class Helpstat extends State<Help> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, size: 35.0),
          onPressed: () => {
            // Perform Your action here
            Navigator.of(context).pop()
          },
        ),
        backgroundColor: Colors.purple,
        title: Text(
          'Help',
          style: TextStyle(
              color: Colors.white, fontStyle: FontStyle.normal, fontSize: 40),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10.0),
                Text(
                  "Contact us",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  "Phone: 123456789\nEmail: TeamHygge@Hygge.com",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  "About us",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  "(About us placeholder)", //"Project Link: https://github.com/A3server/HyggeApp\n\nEduardo Nunes - @Polpedu - edujgnunes@gmail.com\nVasco Gouveia - @vasco_gouveia\nMariana - @mariislvs\nLucas Anjo - @lucas_matias02659",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
