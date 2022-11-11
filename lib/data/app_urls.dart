class AppUrls {
  static const String domain = "http://apichatapp.webartvision.in";
  static const String _api = "$domain/api";

  //
  static const getAllUsers = "$_api/get";
  static const signInWithId = "$_api/users/login";
  static const signUpWithPhoneAndPassword = "$_api/users/signup";
  static const getCurrentUserBytoken = "$_api/users/login-via-token";
}
