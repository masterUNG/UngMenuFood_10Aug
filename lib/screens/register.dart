import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  Color colorText = Colors.brown[600];

  // Method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name Display:',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'Type Name in English',
        helperStyle: TextStyle(color: Colors.green[900]),
        hintText: 'Name not Blank',
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget userText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'User:',
        labelStyle: TextStyle(color: Colors.blue),
        helperText: 'Type User in English',
        helperStyle: TextStyle(color: Colors.blue[900]),
        hintText: 'User not Blank',
        icon: Icon(
          Icons.account_circle,
          size: 36.0,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password:',
        labelStyle: TextStyle(color: Colors.red),
        helperText: 'Type Password in English',
        helperStyle: TextStyle(color: Colors.red[900]),
        hintText: 'Password not Blank',
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[registerButton()],
        backgroundColor: colorText,
        title: Text('Register'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          nameText(),
          userText(),
          passwordText(),
        ],
      ),
    );
  }
}
