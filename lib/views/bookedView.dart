import 'package:flutter/material.dart';
import 'package:velo2/widgets/global/scaffold.dart';

class BookedView extends StatefulWidget {
  @override
  _BookedViewState createState() => _BookedViewState();
}

class _BookedViewState extends State<BookedView> {
  @override
  Widget build(BuildContext context) {
    return myScaffold(
      context: context,
      title: 'Booked',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Jambo Hospital Alajo \n Date: 29/05/2020'),
                ),
              ],
            ),
          ),
          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Fabby Chemists\n Date: 19/09/2020'),
                ),
              ],
            ),
          ),
          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Lakeside Clinic\n Date: 09/02/2021'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
