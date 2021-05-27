import 'package:flutter/material.dart';
import 'package:velo2/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Text('Sign Up'),
              flex: 1,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signUp(email: emailController.text.trim(), password: passwordController.text.trim());
                },
                child: Text('Sign up'))
          ],
        ),
      ),
    ));
  }
}
