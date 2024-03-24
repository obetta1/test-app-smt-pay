import 'package:smart_pay_app/data/models/email_token_response.dart';

import '../repository/repository.dart';

class GetEmailUseCase {
  final Repository repository;

  GetEmailUseCase(this.repository);

  Future<String?> execute(String email) async {
    final data = await repository.getEmailToke(email);
    return data.token;
  }
}
