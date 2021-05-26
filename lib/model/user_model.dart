class UserModel {
  final int id;
  String username;
  String password;
  String type;

  UserModel({
    this.id,
    this.username,
    this.password,
    this.type,
  });
}

var userData = [
  UserModel(
    id: 0,
    username: "admin",
    password: "admin123",
    type: "admin"
  ),
  UserModel(
    id: 0,
    username: "sysadmin",
    password: "sysadmin123",
    type: "sysadmin"
  ),
];
