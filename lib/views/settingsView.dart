import 'package:flutter/material.dart';
import 'package:velo2/services/auth_service.dart';
import 'package:velo2/widgets/global/scaffold.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return myScaffold(
      title: 'Settings',
      context: context,
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            context.read<AuthenticationService>().signOut();
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
