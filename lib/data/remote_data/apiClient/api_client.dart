import 'package:dio/dio.dart';
import 'package:smart_pay_app/data/models/login_response.dart';

import '../../../core/app_export.dart';

import '../../../presentation/otp_authentication_screen/models/otp_response.dart';
import '../../models/dashboard_response.dart';
import '../../models/email_token_response.dart';
import '../url_config.dart';
import 'network_interceptor.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  static final ApiClient _apiClient = ApiClient._internal();
  var baseUrl = UrlConfig.baseUrl;

  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
  ))
    ..interceptors.add(NetworkInterceptor())
    ..interceptors.add(
      LogInterceptor(requestBody: true, logPrint: printDioLogs),
    );

  ///method can be used for checking internet connection
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      ProgressDialogUtils.showSnackbar(
          'INTERNET ERROR', "No Internet Found!please check your internet ");
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    Logger.log(
      response.data["errors"],
      stackTrace: response.data,
    );
    return false;
  }

  /// Returns a [RegisterResponse] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<RegisterResponse> registerUser(
      RegisterRequestModel registerInfo) async {
    ProgressDialogUtils.showProgressDialog();
    var data = registerInfo.toJson();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$baseUrl${UrlConfig.register}',
        data: data,
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return RegisterResponse.fromJson(data["data"]);
      } else {
        throw response.data != null
            ? RegisterResponse.fromJson(response.data["data"])
            : "${response.data["errors"]}";
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Returns a [AllCarModel] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<EmailTokenResponse> getEmailToke(String email) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      var response = await _dio.post(
        '$baseUrl${UrlConfig.getEmailToken}',
        data: {"email": email},
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return EmailTokenResponse.fromJson(data["data"]);
      } else {
        throw response.data != null
            ? EmailTokenResponse.fromJson(response.data["data"])
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Returns a [CarMediaModel] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future logoutUser(String id) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      //await isNetworkConnected();
      var response = await _dio.get(
        '$baseUrl${UrlConfig.logout}$id',
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Returns a list of [LoginResponse] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<LoginResponse> loginUser({
    required String email,
    required String password,
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      //await isNetworkConnected();
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
        "device_name": "mobile",
      };
      var response = await _dio.post(
        '$baseUrl${UrlConfig.login}',
        data: data,
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return LoginResponse.fromJson(data["data"]);
      } else {
        ProgressDialogUtils.showSnackbar("ERROR", "${response.data["error"]}");
        throw response.data != null
            ? LoginResponse.fromJson(response.data)
            : response.data["error"];
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Returns a list of [LoginResponse] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<OtpResponse> verifyEmail({
    required String email,
    required String token,
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      //await isNetworkConnected();
      Map<String, dynamic> data = {
        "email": email,
        "token": token,
      };
      var response = await _dio.post(
        '$baseUrl${UrlConfig.verifyEmailToken}',
        data: data,
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return OtpResponse.fromJson(data["data"]);
      } else {
        ProgressDialogUtils.showSnackbar("ERROR", "${response.data["error"]}");
        throw response.data != null
            ? OtpResponse.fromJson(response.data["data"])
            : response.data["error"];
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();

      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  var pref = PrefUtils();

  /// Returns a list of [LoginResponse] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<DashBoardResponse> getDashboardSecret() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await _dio.get(
        '$baseUrl${UrlConfig.dashboard}',
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      print("===>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${response.toString()}");
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return DashBoardResponse.fromJson(data["data"]);
      } else {
        ProgressDialogUtils.showSnackbar("ERROR", "${response.data["error"]}");
        throw response.data != null
            ? DashBoardResponse.fromJson(response.data["error"])
            : response.data["error"];
      }
    } catch (error, stackTrace) {
      print("===>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${error.toString()}");
      ProgressDialogUtils.hideProgressDialog();
      ProgressDialogUtils.showSnackbar("ERROR", "$error");
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
