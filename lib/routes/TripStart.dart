import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
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

// ignore: must_be_immutable
class TripStartState extends State<TripStart> {
  late GoogleMapController _controller;
  late Widget _child;
  late Position LOCATUAL, LOCPERSONMATCH;
  late double height = MediaQuery.of(context).size.height;
  late final Uint8List _markerIcon;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var response = await http.get(Uri.parse('https://www.woolha.com/media/2020/03/eevee.png'));
    _markerIcon = response.bodyBytes;

    //_markerIcon = await getBytesFromAsset('static/iconimg.png', 150);

    setState(() {
      LOCATUAL = res;
      _child = mapWidget(); //consigo assumir agora o mapwidget
    });
  }

  void _setMapStyle(GoogleMapController _controller) async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('static/map_style.json');
    _controller.setMapStyle(style);
  }



  Set<Marker> _createMarker(){
    RequestAssistant req = new RequestAssistant();
    return <Marker>[
      Marker(
        markerId: MarkerId('PosAtual'),
        zIndex: 2,
        position: LatLng(LOCATUAL.latitude, LOCATUAL.longitude),
        infoWindow: InfoWindow(
          title: "This is your location",
        ),
        icon: BitmapDescriptor.defaultMarker,//BitmapDescriptor.fromBytes(_markerIcon)
      ),
      Marker(
        markerId: MarkerId('PosPerson'),
        zIndex: 1,
        position: LatLng(req.data[0]["lat"],req.data[0]["lng"]), //a primeira pessoa que nos apareceu do nosso "server"
        infoWindow: InfoWindow(
          title: "Person who you matched with!",
        ),
        icon: BitmapDescriptor.fromBytes(_markerIcon),
      )
    ].toSet();
  }

  @override
  void initState() {
    getCurrentLocation();
    _child = Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: SpinKitChasingDots(color: Colors.purple));

    super.initState();
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
                child: _child, //mapa ou ripple effect
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
        center: LatLng(LOCATUAL.latitude, LOCATUAL.longitude),
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
      target: LatLng(LOCATUAL.latitude, LOCATUAL.longitude),
      zoom: 17,
    );

    return GoogleMap(
      markers: _createMarker(),
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _initalCameraPOS,
      onCameraMove: null,
      circles: circles,
    );
  }
}
