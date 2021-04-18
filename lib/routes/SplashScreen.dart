import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color purple = new Color(0xFF9a33b6);

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  String Route = "/signupName";

  Future checkFirstSeen() async {
    final prefs = await SharedPreferences.getInstance();
    String value = (prefs.getString('UserName') ?? 0)
        .toString(); //vejo se tenho UserName na localStorage.
    //print("VALUE: $value");
    //print("Route: $Route");

    if (value != "0") {
      //vejo se tenho, se tiver route para a home se não precisamos de fazer Signup.
      Route = "/home";
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    checkFirstSeen();

    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, Route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9a33b6),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ScaleTransition(
                    scale: _animation,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Icon(
                        Icons.directions_run_rounded,
                        color: purple,
                        size: 150,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Hygge",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: 'Poppins-Bold',
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    "danish noun",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 75, right: 75),
                  child: Text(
                    "Coziness and comfortable conviviality with feelings of wellness and contentment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
