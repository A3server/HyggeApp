import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HyggeApp/routes/HomePage.dart';
import 'package:HyggeApp/components/Popups.dart';
import 'dart:async';
import '../main.dart';

late String user;

class BottomNavBar extends StatefulWidget {
  final bool showcancel;
  final Function onAccept;
  final Function onCancel;
  BottomNavBar(
      {required this.showcancel,
        required this.onAccept,
        required this.onCancel});

  BottomNavBarState createState() =>
      BottomNavBarState(showcancel, onAccept, onCancel);
}

class BottomNavBarState extends State<BottomNavBar> {
  BottomNavBarState(this.showcancel, this.onAccept, this.onCancel);
  bool showcancel;
  Function onAccept;
  Function onCancel;
  bool? accepted;
  @override
  Widget build(BuildContext context) {
    Widget swapwidget = showcancel ? cancelBTNS(context) : NormalBTNS(context);

    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: AnimatedSwitcher(
        duration: Duration(seconds: 5),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(child: child, scale: animation),
        child: swapwidget,
      ),
    );
  }

  Widget cancelBTNS(context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Icon(
          Icons.info_rounded,
          size: 45,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
        child: Text(
          'Searching for a pair...',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: Text(
          'You can cancel at any time your search!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: TextButton(
          child: Text("Cancel",
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  color: Colors.white)),
          onPressed: () => {
            setState(() {
              showcancel = !showcancel;
              onCancel();
            })
          },
          style: TextButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            elevation: 1,
            padding: EdgeInsets.only(right: 40, left: 40, top: 5, bottom: 5),
            backgroundColor: myMainColor.shade100,
            //normal color
            primary: Color(0xFF631d77), //onclick color
          ),
        ),
      )
    ]);
  }

  Widget NormalBTNS(context) {
    final TripARGS args =
    ModalRoute.of(context)!.settings.arguments as TripARGS;
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Icon(
          Icons.info_rounded,
          size: 45,
        ),
      ),
      Text(
        'Destination',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w800, color: Colors.black),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Text(
          args.Nameofloc,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
        child: Text(
          'If no one is around at the moment Hygge will let you know when a fellow user crosses paths with you',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  showcancel = !showcancel;
                  Timer(Duration(seconds: 4), () {
                    user = "https://www.woolha.com/media/2020/03/eevee.png";

                    showAlerDialogUSERFOUND(context, user).then((value) {
                      accepted = value;
                      if (accepted! ? true : false) {
                        onAccept();
                      }
                    });
                  });
                });
              },
              child: Text("Let's Go!",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.white)),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                elevation: 1,
                padding:
                EdgeInsets.only(right: 40, left: 40, top: 5, bottom: 5),
                backgroundColor: myMainColor.shade100,
                //normal color
                primary: Color(0xFF631d77), //onclick colors
              ),
            ),
          )
        ],
      )
    ]);
  }

  void searching(bool searching) {
    const oneSec = const Duration(seconds: 1);

    new Timer.periodic(oneSec, (Timer t) {
      if (!searching) t.cancel();
    });
  }
}