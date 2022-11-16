class AppUrls {
  // static const String domain = "http://apichatapp.webartvision.in";
  static const String domain = "http://199.192.24.175:3000";
  static const String _api = "$domain/api";

  //
  static const getAllUsers = "$_api/get";

  //Auth
  static const signInWithId = "$_api/users/login";
  static const signUpWithPhoneAndPassword = "$_api/users/signup";
  static const getCurrentUserBytoken = "$_api/users/login-via-token";

  static const profileUpdate = "$_api/users/update-profile";

  //Room
  static const getAllRoom = "$_api/rooms/get-rooms";
  static const createNewRoom = "$_api/rooms/create-room";
  // static const deleteRoom = "$_api";
}
