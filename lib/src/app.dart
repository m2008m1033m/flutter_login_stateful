import 'package:flutter/material.dart';
import './screens/login_screen.dart';

class App extends StatelessWidget {
  void performLogin() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
        appBar: AppBar(
          title: Text('Log me in'),
        ),
      ),
    );
  }
}
