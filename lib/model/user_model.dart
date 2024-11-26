class UserModel {
  String? email;
  String? password;
  String? token;

  UserModel({
    required this.email,
    required this.password,
    required token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }
}
