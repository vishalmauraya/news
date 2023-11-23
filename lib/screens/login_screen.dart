import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Perform user authentication
            User? user = await _auth.signInWithEmailAndPassword(
              'user@example.com',
              'password123',
            );

            if (user != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
