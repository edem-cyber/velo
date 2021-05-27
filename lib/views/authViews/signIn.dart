import 'package:flutter/material.dart';
import 'package:velo2/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Velo',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 50
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ],
            )),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                },
                child: Text('Sign In')),
          ],
        ),
      ),
    ));
  }
}
