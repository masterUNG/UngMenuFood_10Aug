import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:ung_menu_food/models/food_model.dart';
import 'package:ung_menu_food/screens/detail_food.dart';

class FoodListView extends StatefulWidget {
  @override
  _FoodListViewState createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  // Explicit
  List<FoodModel> foodModels = [];

  // Method
  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    String urlString = 'https://www.androidthai.in.th/man/getAllDataMaster.php';

    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result = $result');

    for (var myFoodModel in result) {
      FoodModel foodModel = FoodModel.fromJSON(myFoodModel);
      setState(() {
        foodModels.add(foodModel);
      });
    }
  }

  Widget showName(int index) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        foodModels[index].nameFood,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }

  Widget showDetail(int index) {
    String detailShot = foodModels[index].detail;
    if (detailShot.length > 50) {
      detailShot = detailShot.substring(0, 50);
      detailShot = '$detailShot ...';
    }
    return Text(detailShot);
  }

  Widget showText(int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: <Widget>[
          showName(index),
          showDetail(index),
        ],
      ),
    );
  }

  Widget showImage(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Image.network(
        foodModels[index].imagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showFoodList() {
    return ListView.builder(
      itemCount: foodModels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            decoration: index % 2 == 0
                ? BoxDecoration(color: Colors.orange.shade100)
                : BoxDecoration(color: Colors.orange.shade300),
            child: Row(
              children: <Widget>[
                showText(index),
                showImage(index),
              ],
            ),
          ),
          onTap: () {
            print('You Click Index $index');
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => DetailFood(
                      foodModel: foodModels[index],
                    ));
            Navigator.of(context).push(materialPageRoute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return showFoodList();
  }
}
