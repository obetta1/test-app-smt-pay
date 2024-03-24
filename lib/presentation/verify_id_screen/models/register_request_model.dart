class RegisterRequestModel {
  String? fullName;
  String? username;
  String? email;
  String? country;
  String? password;
  String? deviceName;

  RegisterRequestModel(
      {required this.fullName,
      required this.username,
      required this.email,
      required this.country,
      required this.password,
      required this.deviceName});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    username = json['username'];
    email = json['email'];
    country = json['country'];
    password = json['password'];
    deviceName = json['device_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['country'] = this.country;
    data['password'] = this.password;
    data['device_name'] = this.deviceName;
    return data;
  }
}
