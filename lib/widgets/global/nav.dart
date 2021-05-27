import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velo2/views/bookedView.dart';
import 'package:velo2/views/homeView.dart';
import 'package:velo2/views/settingsView.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomeView(),
    BookedView(),
    SettingsView()
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: Colors.blue[700],
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.layers_alt,
              ),
              label: 'Booked'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_rounded,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
