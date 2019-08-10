import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myLogo = 100.0;

  // Method
  Widget mySizeBox() {
    return SizedBox(
      width: 3.0,
      height: 8.0,
    );
  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.brown[300],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.brown[600]),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.brown[600]),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: myLogo,
      height: myLogo,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Ung Menu Food',
        style: TextStyle(
            fontSize: 30.0,
            color: Colors.brown[600],
            fontWeight: FontWeight.bold,
            fontFamily: 'IndieFlower'),
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          signInButton(),
          mySizeBox(),
          signUpButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blueGrey],
            radius: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            mySizeBox(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
