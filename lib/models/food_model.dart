class FoodModel {

  // Field
  String id, nameFood, price, detail, imagePath;

  // Constructor
  FoodModel(this.id, this.nameFood, this.price, this.detail, this.imagePath);

  FoodModel.fromJSON(Map<String, dynamic> parseJSON){
    id = parseJSON['id'];
    nameFood = parseJSON['NameFood'];
    price = parseJSON['Price'];
    detail = parseJSON['Detail'];
    imagePath = parseJSON['ImagePath'];

  }


  
}