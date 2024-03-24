import '../../../presentation/verify_id_screen/models/register_request_model.dart';
import '../../../presentation/verify_id_screen/models/register_response_model.dart';
import '../repository/repository.dart';

class VerifyIdentityUseCase {
  final Repository repository;

  VerifyIdentityUseCase({required this.repository});

  Future<RegisterResponse> execute(
      RegisterRequestModel registerRequestModel) async {
    final data = await repository.verifyIdentity(registerRequestModel);
    return data;
  }
}
