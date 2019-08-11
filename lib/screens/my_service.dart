import 'package:flutter/material.dart';
import 'package:ung_menu_food/models/user_model.dart';
import 'package:ung_menu_food/screens/food_listview.dart';
import 'package:ung_menu_food/screens/infomation.dart';

class MyService extends StatefulWidget {
  final UserModel userModel;
  MyService({Key key, this.userModel}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  UserModel myUserModel;
  String nameLogin = '';
  Widget myWidget = FoodListView();

  // Method
  @override
  void initState() {
    super.initState();
    setState(() {
      myUserModel = widget.userModel;
      nameLogin = myUserModel.name;
    });
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showApp() {
    return Text(
      'Ung Menu Food',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.brown,
        fontFamily: 'IndieFlower',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget myDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.white, Colors.blueGrey],
          radius: 1.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          showApp(),
        ],
      ),
    );
  }

  Widget showMenuFood() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('Menu Food'),
      onTap: () {
        setState(() {
          myWidget = FoodListView();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget showMenuInfo() {
    return ListTile(
      leading: Icon(Icons.info),
      title: Text('Information'),onTap: (){
        setState(() {
          myWidget = Information();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myDrawerHeader(),
          showMenuFood(),
          showMenuInfo(),
        ],
      ),
    );
  }

  Widget showLogin() {
    return Container(
      alignment: Alignment.topLeft,
      child: ListTile(
        title: Text(
          'My Service',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'Login by $nameLogin',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: showLogin(),
      ),
      body: myWidget,
      drawer: myDrawer(),
    );
  }
}
