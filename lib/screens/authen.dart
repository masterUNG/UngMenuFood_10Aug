import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:ung_menu_food/models/user_model.dart';
import 'package:ung_menu_food/screens/my_service.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  Color colorText = Colors.brown.shade700;
  final formKey = GlobalKey<FormState>();
  String user, password;

  // Method
  Widget userText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'User :',
        helperText: 'Type Your User',
      ),
      validator: (String value) {
        if (checkSpace(value)) {
          return 'Please Fill User in Blank';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  bool checkSpace(String value) {
    return value.isEmpty;
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password :',
        helperText: 'Type Your Password',
      ),
      validator: (String value) {
        if (checkSpace(value)) {
          return 'Please Fill Password in Blank';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Future<void> checkAuthen() async {
    String urlString =
        'https://www.androidthai.in.th/man/getUserWhereUserMaster.php?isAdd=true&User=$user';

    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result = $result');

    if (result.toString() == 'null') {
      myAlert('User False', 'No $user in my Database');
    } else {
      for (var myJSON in result) {
        print('myJSON = $myJSON');
        UserModel userModel = UserModel.fromJSON(myJSON);

        if (password == userModel.password.trim()) {
          print('Login Success');

          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => MyService(userModel: userModel,));
          Navigator.of(context).pushAndRemoveUntil(
              materialPageRoute, (Route<dynamic> route) => false);
        } else {
          myAlert('Password False', 'Plese try Aganis Password False');
        }
      }
    }
  }

  Widget showTitleAlert(String title) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 36.0,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24.0, color: Colors.red.shade800),
      ),
    );
  }

  void myAlert(String titleString, String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showTitleAlert(titleString),
          content: Text(messageString),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
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
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print('user = $user, password = $password');
            checkAuthen();
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: colorText,
        title: Text('Authen'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                userText(),
                passwordText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
