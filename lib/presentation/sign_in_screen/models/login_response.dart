class LoginResponse {
  User? user;
  String? token;

  LoginResponse({this.user, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? id;
  String? fullName;
  String? username;
  String? email;
  String? phone;
  String? phoneCountry;
  String? country;
  String? avatar;

  User(
      {this.id,
      this.fullName,
      this.username,
      this.email,
      this.phone,
      this.phoneCountry,
      this.country,
      this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    phoneCountry = json['phone_country'];
    country = json['country'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['phone_country'] = this.phoneCountry;
    data['country'] = this.country;
    data['avatar'] = this.avatar;
    return data;
  }
}
