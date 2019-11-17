import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  Position _currentPosition;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Placemark place;

  var latitudeHome = 44.430560;
  var longitudeHome = 25.988320;

  _getPosition(){
    geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
    .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getDistanceFromHome() async {
    _getPosition();
    double distanceInMeters = await
    Geolocator().distanceBetween(
        _currentPosition.longitude, _currentPosition.latitude,
        longitudeHome, latitudeHome);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
