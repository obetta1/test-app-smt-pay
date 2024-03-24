import 'package:smart_pay_app/data/models/login_response.dart';

import '../repository/repository.dart';

class LoginUseCase {
  final Repository repository;

  LoginUseCase({required this.repository});

  Future<LoginResponse> execute(String email, String password) async {
    final data = await repository.loginUser(email, password);
    return data;
  }
}
