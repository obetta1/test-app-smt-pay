enum UrlEnvironment { development, production }

///this is used to configure the url depending on the environment[development] or [production]
class UrlConfig {
  static UrlEnvironment _environment = UrlEnvironment.development;
  static UrlEnvironment get environment => _environment;
  static void setEnvironment(UrlEnvironment env) => _environment = env;

  static String get baseUrl => "$_baseUrl";

  static get _baseUrl {
    switch (_environment) {
      case UrlEnvironment.development:
        return "https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/";

      case UrlEnvironment.production:
        return "https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/";
    }
  }

  static const String register = "auth/register";
  static const String verifyEmailToken = "auth/email/verify";
  static const String getEmailToken = "auth/email";
  static const String login = "auth/login";
  static const String logout = "auth/logout";
  static const String dashboard = "dashboard";
}
