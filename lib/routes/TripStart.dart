import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:HyggeApp/components/BottomAppBar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:HyggeApp/components/RequestAssistant.dart';
import 'package:http/http.dart' as http;
class TripStart extends StatefulWidget {
  const TripStart({Key? key}) : super(key: key);

  @override
  TripStartState createState() => TripStartState();
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

Future<Uint8List> getBytesFromNetwork(String url) async {
  var response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

// ignore: must_be_immutable
class TripStartState extends State<TripStart> {
  late GoogleMapController _controller;
  late Widget _child;
  late Position LOCATUAL, LOCPERSONMATCH;
  late double height = MediaQuery.of(context).size.height;
  late Uint8List _markerIcon;
  late Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  RequestAssistant req = new RequestAssistant();

  void getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // var response = await http
    //     .get(Uri.parse('https://www.woolha.com/media/2020/03/eevee.png'));
    // _markerIcon = response.bodyBytes;

    //_markerIcon = await getBytesFromAsset('static/iconimg.png', 150);

    setState(() {
      //LOCATUAL = res;

      markers[MarkerId("0")] = Marker(
        markerId: MarkerId("0"),
        ///Como o proposito desta build é dar showcase, decidimos usar uma localização fixa.
        position: LatLng(
            req.data[1]["lat"],
            req.data[1]
                ["lng"]), //LatLng(LOCATUAL.latitude, LOCATUAL.longitude),
        infoWindow: InfoWindow(
          title: "This is your location",
        ),
      );
    });
  }

  void _setMapStyle(GoogleMapController _controller) async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('static/map_style.json');
    _controller.setMapStyle(style);
  }

  @override
  void initState() {
    getCurrentLocation();
    _child = Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: SpinKitChasingDots(color: Colors.purple));

    super.initState();
  }

  addMarker(String id, LatLng position, Uint8List marker) {
    setState(() {
      print(position);
      markers[MarkerId(id)] = Marker(
          markerId: MarkerId(id),
          position: position,
          icon: BitmapDescriptor.fromBytes(marker));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Center(
                child: mapWidget(), //mapa ou ripple effect
              ),
              DraggableScrollableSheet(
                  initialChildSize: (350) / height,
                  minChildSize: 120 / height, //0.15
                  maxChildSize: (350) / height,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                        controller: scrollController,
                        child: BottomNavBar(
                          showcancel: false,
                          onAccept: () async {
                            print("YOOOOOOOOOOOOOO");
                            _markerIcon = await getBytesFromAsset(
                                "assets/eeve-01.png", 100);
                            print("_marker done");

                            print(req.data[0]["lat"]);
                            addMarker(
                                "1",
                                LatLng(req.data[0]["lat"], req.data[0]["lng"]),
                                _markerIcon);
                          },
                          onCancel: () {
                            setState(() {
                              markers.remove(MarkerId("1"));
                            });
                          },
                        ));
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 37,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Trip",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mapWidget() {
    Set<Circle> circles = Set.from([
      Circle(
        circleId: CircleId('radfind'),
        center: LatLng(req.data[1]["lat"], req.data[1]["lng"]),
        radius: 100,
        strokeWidth: 0,
        strokeColor: Colors.blueAccent,
        fillColor: Colors.blue.withOpacity(0.3),
      )
    ]);

    void _onMapCreated(GoogleMapController controller) {
      _controller = controller;
      _setMapStyle(_controller);
    }

    CameraPosition _initalCameraPOS = CameraPosition(
      target: LatLng(req.data[1]["lat"], req.data[1]["lng"]),
      zoom: 17,
    );

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: _initalCameraPOS,
      markers: Set<Marker>.of(markers.values),
      myLocationButtonEnabled: true,
      circles: circles,
    );
  }
}
