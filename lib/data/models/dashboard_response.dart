class DashBoardResponse {
  String? secret;

  DashBoardResponse({this.secret});

  DashBoardResponse.fromJson(Map<String, dynamic> json) {
    secret = json['secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['secret'] = secret;
    return data;
  }
}
