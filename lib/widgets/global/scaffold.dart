import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget myScaffold({BuildContext context, Widget child, String title}) {
  return Scaffold(
    backgroundColor: Colors.grey[300],
    appBar: AppBar(
      iconTheme: IconThemeData(color: Colors.blue[800]),
      title: AutoSizeText(
        title,
        maxFontSize: 20,
        style: TextStyle(color: Colors.blue[800], fontSize: 25),
      ),
      elevation: 1,
      backgroundColor: Colors.grey[100],
    ),
    body: Container(
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(30,20,30,0),
              child: child)
        ],
      ),
    ),
  );
}
// homeCard(cardImage: '',cardText: '',category: SettingsView(), context: context)
