import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is Infomation',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
