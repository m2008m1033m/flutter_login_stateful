import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter a password',
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Colors.blue,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Posting $email and $password to the API');
        }
      },
    );
  }
}
