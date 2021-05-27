import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velo2/widgets/global/scaffold.dart';
import 'package:velo2/services/place_service.dart';
import 'package:velo2/models/place_model.dart';
import 'package:velo2/views/placeDetails.dart';

class PharmaciesView extends StatefulWidget {
  @override
  _PharmaciesViewState createState() => _PharmaciesViewState();
}

class _PharmaciesViewState extends State<PharmaciesView> {
  @override
  String _currentPlaceId;
  List<PlaceDetail> _places;
  VoidCallback onItemTapped;
  @override
  Widget build(BuildContext context) {
    return myScaffold(
        context: context, title: 'Pharmacies', child: _createContent());
  }

  final _biggerFont = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);
  Widget _createContent() {
    if (_places == null) {
      return Center(
        child: CupertinoActivityIndicator(radius: 20,),
      );
    } else {
      return Column(
        children: _places.map((f) {
          return Card(
            child: ListTile(
                title: Text(
                  f.name,
                  style: _biggerFont,
                ),
                leading: Image.network(f.icon),
                subtitle: Text(f.vicinity),
                isThreeLine: true,
                onTap: () {
                  _currentPlaceId = f.place_id;
                  handleItemTap(f);
                }),
          );
        }).toList(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (_places == null) {
      getNearbyPlaces('pharmacy').then((data) {
        this.setState(() {
          _places = data;
        });
      });
    }

    //print("count: "+_places.length.toString());
  }

  handleItemTap(PlaceDetail place) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
                new PlaceDetailPage(place.place_id)));
  }
}
