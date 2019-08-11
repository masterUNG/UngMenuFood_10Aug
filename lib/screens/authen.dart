import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  Color colorText = Colors.brown.shade700;

  // Method
  Widget userText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'User :',
        helperText: 'Type Your User',
      ),
      validator: (String value) {},
      onSaved: (String value) {},
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password :',
        helperText: 'Type Your Password',
      ),
      validator: (String value) {},
      onSaved: (String value) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorText,
        child: Icon(
          Icons.navigate_next,
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: colorText,
        title: Text('Authen'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              userText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
