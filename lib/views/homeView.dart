import 'package:flutter/material.dart';
import 'package:velo2/services/place_service.dart';
import 'package:velo2/views/HospitalsView.dart';
import 'package:velo2/views/PharmaciesView.dart';
import 'package:velo2/widgets/global/scaffold.dart';
import 'package:velo2/widgets/homewidgets/homeCard.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

String test;
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return myScaffold(
        context: context,
        title: 'Home',
        child: Column(
          children: [
            homeCard(
                cardImage:
                    'https://images.unsplash.com/photo-1512069772995-ec65ed45afd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=377&q=80',
                cardText: 'Pharmacies',
                category: PharmaciesView(),
                context: context),
            homeCard(
                cardImage:
                    'https://images.pexels.com/photos/5327647/pexels-photo-5327647.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                cardText: 'Hospitals',
                category: HospitalsView(),
                context: context),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    test = getLocationData().toString();
  }
}
