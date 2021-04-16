//PAGINA PARA FAZER REQUESTS
import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class LOCATIONS {
  late final String ADDRS;
  //Constructor
  LOCATIONS({@required required this.ADDRS});
  factory LOCATIONS.fromJson(Map<String, dynamic> json) {
    return LOCATIONS(
      ADDRS: json['results'][0]['formatted_address'],
    );
  }
}

class RequestAssistant {
  static getactualpos() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  static Future<LOCATIONS> fetchLOCATION() async {
    Position currentPosition = await getactualpos();

    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${currentPosition.latitude},${currentPosition.longitude}&key=AIzaSyD4wNeFczSONDf7rR1MLoj__onJIRBCJrs";
    //print("YOYOYO ${Uri.parse(url)}");
    final response = await http.get(Uri.parse(url));
    //print("$response");
    try {
      if (response.statusCode == 200) {
        //print("Res: ${LOCATIONS.fromJson(jsonDecode(response.body))}");
        return LOCATIONS.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed');
      }
    } catch (err) {
      print("$err");
      throw Exception('Failed');
    }
  }
}
