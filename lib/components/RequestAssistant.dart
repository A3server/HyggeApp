//PAGINA PARA FAZER REQUESTS
import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:HyggeApp/components/Popups.dart';

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

  //metodo de calcular distancia com matematicas super complicadas e ~~fixes~~
  static double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }


  //Nearby people, got from theoretical server.

  //O server deu nos quem esta proximo de nos e vai para o mesmo destino.
  List<dynamic> data = [{
    "lat": 40.1845,
    "lng": -8.4136
  },{
    "lat":40.1851,
    "lng": -8.4116
  },{
    "lat": 40.1851,
    "lng": -8.4133
  }
  ];
  List<dynamic> getdata(){
    return data;
  }

  static checkpair(List<dynamic> data, build) async{
    //no server :(
    Position currentPosition = await getactualpos();
    double raio= 2000;
    double totaldistance = 0;
    for(var i = 0; i < data.length-1; i++) {
      //fazer 4 loop
      totaldistance = calculateDistance(
          currentPosition.latitude, currentPosition.latitude, data[0]["lat"],
          data[0]["lng"]);
      print("$totaldistance");

      if (totaldistance < raio) {
        print("Match found");
        return true;
      }
    }
  }
}
