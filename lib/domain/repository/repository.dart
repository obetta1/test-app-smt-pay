import '../../../core/utils/logger.dart';
import '../../../presentation/otp_authentication_screen/models/otp_response.dart';
import '../../../presentation/verify_id_screen/models/register_request_model.dart';
import '../../../presentation/verify_id_screen/models/register_response_model.dart';
import '../../core/app_export.dart';
import '../../data/models/dashboard_response.dart';
import '../../data/models/email_token_response.dart';
import '../../data/models/login_response.dart';

class Repository {
  final _apiClient = ApiClient();

  Future<EmailTokenResponse> getEmailToke(String email) async {
    final data = await _apiClient.getEmailToke(email);
    printDioLogs(data.toJson());
    return data;
  }

  Future<OtpResponse> verifyEmailToke(String email, String token) async {
    final data = await _apiClient.verifyEmail(email: email, token: token);
    printDioLogs(data.toJson());
    return data;
  }

  Future<LoginResponse> loginUser(String email, String password) async {
    final data = await _apiClient.loginUser(email: email, password: password);
    printDioLogs(data.toJson());
    return data;
  }

  Future<RegisterResponse> verifyIdentity(
      RegisterRequestModel registerRequest) async {
    final data = await _apiClient.registerUser(registerRequest);
    printDioLogs(data);
    return data;
  }

  Future<DashBoardResponse> getDashboardSecret() async {
    final data = await _apiClient.getDashboardSecret();
    printDioLogs(data);
    return data;
  }
}
