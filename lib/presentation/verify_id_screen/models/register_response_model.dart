import '../../../data/models/login_response.dart';

class RegisterResponse {
  User? user;
  String? token;

  RegisterResponse({this.user, this.token});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

// class User {
//   String? fullName;
//   String? username;
//   String? email;
//   String? country;
//   String? id;
//
//   User({this.fullName, this.username, this.email, this.country, this.id});
//
//   User.fromJson(Map<String, dynamic> json) {
//     fullName = json['full_name'];
//     username = json['username'];
//     email = json['email'];
//     country = json['country'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['full_name'] = this.fullName;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['country'] = this.country;
//     data['id'] = this.id;
//     return data;
//   }
//}
