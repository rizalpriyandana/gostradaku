class LoginModel {
  static String urlApi = "https://siakad.strada.ac.id/mobile/login/do_log";
  static String username = 'username';
  static String password = 'password';
}

class InsertTokenModel {
  static String nim = 'nim';
  static String token = 'token';
}

class User {
  User({
    required this.nim,
    required this.username,
    required this.photo,
    required this.name,
  });

  String nim;
  String username;
  String photo;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        nim: json["nim"],
        username: json["username"],
        photo: json["photo"],
        name: json["name"],
      );
}
