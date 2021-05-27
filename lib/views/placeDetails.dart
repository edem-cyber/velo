import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velo2/models/place_model.dart';
import 'package:velo2/services/place_service.dart';
import 'package:velo2/widgets/global/scaffold.dart';

class PlaceDetailPage extends StatefulWidget {
  final String _place_id;
  PlaceDetailPage(this._place_id);
  @override
  State createState() => new PlaceDetailState();
}
class PlaceDetailState extends State<PlaceDetailPage> {
  TextEditingController formDate = new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    if (_place == null) {
      return myScaffold(
          context: context,
          title: 'Loading',
          child: Center(
            child: CupertinoActivityIndicator(
              radius: 20,
            ),
          ));
    }
    return Material(
        color: Colors.blue[500],
        child: myScaffold(
          title: _place.name,
          context: context,
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
              getCard("Address ", _place.formatted_address, Icons.location_on),
              getCard(
                  "Working Hours ", _place.weekday_text.join("\n"), Icons.work),
              getCard("Call ", _place.international_phone_number, Icons.phone),
              TextFormField(
                controller: formDate,
                decoration: InputDecoration(
                    labelText: 'Enter Date', hintText: 'dd/mm/yyyy'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Map<String, dynamic> data = {
                      'date': formDate.text,
                      'name': _place.name
                    };
                    FirebaseFirestore.instance.collection('booked').add(data);
                  },
                  child: Text('Book'))
            ],
          ),
        ));
  }

  PlaceDetail _place;
  @override
  void initState() {
    super.initState();

    getPlace(widget._place_id).then((data) {
      setState(() {
        _place = data;
      });
    });
  }

  getCard(String header, String content, IconData iconData) {
    return Card(
        color: Colors.white,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(header,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    Icon(
                      iconData,
                      color: Colors.green,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(content, textAlign: TextAlign.start),
                )
              ],
            ),
          ),
        ));
  }
}
