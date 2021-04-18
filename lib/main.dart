import 'package:flutter/material.dart';
import 'package:HyggeApp/routes/SplashScreen.dart';
import 'package:HyggeApp/routes/HomePage.dart';
import 'package:HyggeApp/routes/YourTrips.dart';
import 'package:HyggeApp/routes/Settings.dart';
import 'package:HyggeApp/routes/Help.dart';
import 'package:HyggeApp/routes/Signup.dart';
import 'package:HyggeApp/routes/TripStart.dart';

MaterialColor myMainColor = const MaterialColor(
  0xFF9a33b6,
  <int, Color>{
    50: Color(0xFFeac4f5),
    100: Color(0xFFe9a4fc),
    200: Color(0xffd77ff0),
    300: Color(0xffdd6dfc),
    400: Color(0xFFb93ddb),
    500: Color(0xffb01cd9),
    600: Color(0xff8a13ab),
    700: Color(0xff734580),
    800: Color(0xff614669),
  },
);

void main() {
  const String appName = "HyggeApp";
  runApp(MaterialApp(
      title: appName,
      debugShowCheckedModeBanner:
          false, //para nao aparecer aquela banner do debug
      theme: ThemeData(
        dividerTheme: DividerThemeData(
            space: 3,
            indent: 15,
            endIndent: 50,
            thickness: 1,
            color: Colors.black54),
        textTheme: TextTheme(
            //headline corresponde à sidebar.
            subtitle1: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400),
            headline1: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black),
            headline2: TextStyle(fontSize: 18, color: Colors.black),
            headline3: TextStyle(fontSize: 20, color: Colors.black),
            headline4: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 30.0,
        ),
        primarySwatch: myMainColor,
        fontFamily: 'Poppins',
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/signupName": (context) => Signup(),
        "/signupPhone": (context) => SignupData(),
        "/home": (context) => HomePage(),
        "/YourTrips": (context) => YourTrips(),
        "/Settings": (context) => SettingsOnePage(),
        "/Help": (context) => Help(),
        "/TripStart": (context) => TripStart()
      }));
}
