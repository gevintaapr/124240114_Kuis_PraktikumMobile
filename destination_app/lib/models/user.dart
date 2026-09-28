class User {
  String username;
  String password;
  String name;

  User({required this.username, required this.password, required this.name});
}

List<User> users = [
  User(username: "gevi", password: "123", name: "Gevinta Aprilia"),
  User(username: "ayu", password: "124", name: "Ayu Hanifa"),
];