import '../../../presentation/otp_authentication_screen/models/otp_response.dart';
import '../repository/repository.dart';

class VerifyEmailUseCAse {
  final Repository repository;

  VerifyEmailUseCAse({required this.repository});

  Future<OtpResponse> execute(String email, token) async {
    final data = await repository.verifyEmailToke(email, token);
    return data;
  }
}
