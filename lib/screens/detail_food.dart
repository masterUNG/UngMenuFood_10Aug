import 'package:flutter/material.dart';
import 'package:ung_menu_food/models/food_model.dart';

class DetailFood extends StatefulWidget {
  final FoodModel foodModel;
  DetailFood({Key key, this.foodModel}) : super(key: key);

  @override
  _DetailFoodState createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  // Explicit
  FoodModel foodModel;

  // Method
  @override
  void initState() {
    super.initState();
    setState(() {
      foodModel = widget.foodModel;
    });
  }

  Widget backButton() {
    return IconButton(
      icon: Icon(
        Icons.navigate_before,
        color: Colors.blue,
        size: 36.0,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget showImageAndBack() {
    return Stack(
      children: <Widget>[
        Container(
          height: 200.0,
          child: Image.network(
            foodModel.imagePath,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          child: backButton(),
        )
      ],
    );
  }

  Widget showName(){
    return Text(foodModel.nameFood);
  }

  Widget showPrice(){
    return Text(foodModel.price);
  }

  Widget showDetail(){
    return Text(foodModel.detail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            showImageAndBack(),showName(),showPrice(), showDetail(),
          ],
        ),
      ),
    );
  }
}
