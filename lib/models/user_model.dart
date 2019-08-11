class UserModel {

  // Field
  String id, name, user, password, type;

  // Constructor
  UserModel(this.id, this.name, this.user, this.password, this.type);

  UserModel.fromJSON(Map<String, dynamic> parseJSON){
    id = parseJSON['id'];
    name = parseJSON['Name'];
    user = parseJSON['User'];
    password = parseJSON['Password'];
    type = parseJSON['Type'];
  }

  
}