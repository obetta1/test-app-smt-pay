// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:smart_pay_app/core/app_export.dart';

/// NetworkInterceptor class for intercepting API requests, responses, and exceptions.
///
/// This class extends the [Interceptor] class from the Dio HTTP client library
/// and overrides the [onRequest], [onError] and [onResponse] methods to intercept
/// different stages of the API request lifecycle.
///
/// use this class to add custom logic or perform actions such as logging,
/// modifying headers, or handling errors before and after making API requests.
class NetworkInterceptor extends Interceptor {
  factory NetworkInterceptor() => _instance;
  static final NetworkInterceptor _instance = NetworkInterceptor._internal();

  NetworkInterceptor._internal();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    ///add the authorization token to the header
    var pref = PrefUtils();
    String? accessToken = pref.getAccessToken();
    options.headers.addAll({"Authorization": "Bearer $accessToken"});
    return super.onRequest(options, handler);
    //intercept api request
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response?.statusCode == 403) {
      ///session expired
      throw "session has expired, Login to continue";
    }
    handler.next(err);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
    //intercept api responses
  }
}
