// String searchURL =
//     'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${PlacesService().getLatLong()}&rankby=distance&type=pharmacy&key=' +
//         PlacesService().apiKey;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:velo2/services/api_key.dart';
import 'package:velo2/models/place_model.dart';

String lat;
String long;
String locationData;
String url;


Future<String> getLatLong() async {
  var geoposition = await Geolocator.getLastKnownPosition();
  lat = '${geoposition.latitude}';
  long = '${geoposition.longitude}';
  locationData = lat + ',' + long;
  print(locationData);
  return locationData;
}

var realLocation;
getLocationData() {
  var realLocation = getLatLong().then((value) => value);
  return realLocation;
}

Future<List<PlaceDetail>> getNearbyPlaces(String where) async {
  try {
    url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$long&rankby=distance&type=$where&key=$apiKey";
    var reponse =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    List data = json.decode(reponse.body)["results"];
    var places = <PlaceDetail>[];
    data.forEach((f) => places.add(new PlaceDetail(f["place_id"], f["name"],
        f["icon"], f["rating"].toString(), f["vicinity"])));

    return places;
  } catch (e) {
    return null;
  }
}

Future getPlace(String place_id) async {
  try {
    final String detailUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?key=$apiKey&placeid=";
    var response = await http.get(Uri.parse(detailUrl + place_id),
        headers: {"Accept": "application/json"});
    var result = json.decode(response.body)["result"];

    List<String> weekdays = [];
    if (result["opening_hours"] != null)
      weekdays = result["opening_hours"]["weekday_text"]?.cast<String>();
    return new PlaceDetail(
        result["place_id"],
        result["name"],
        result["icon"],
        result["rating"].toString(),
        result["vicinity"],
        result["formatted_address"],
        result["international_phone_number"].toString(),
        weekdays);
  } catch (e) {
    print(e);
  }
}
