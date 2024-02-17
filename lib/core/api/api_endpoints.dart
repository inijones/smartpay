class Endpoint {
  static const String baseUrl =
      "https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1";

  // Auth
  static const getEmailToken = '$baseUrl/auth/email';

  static const verifyEmailToken = '$baseUrl/auth/email/verify';

  static const register = '$baseUrl/auth/register';

  static const login = '$baseUrl/auth/login';

  static const logout = '$baseUrl/dashboard';


}
