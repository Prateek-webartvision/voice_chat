class AppUrls {
  // static const String domain = "http://apichatapp.webartvision.in";
  // static const String domain = "http://199.192.24.175:3000";
  static const String domain = "http://192.168.0.234:3000";
  static const String _api = "$domain/api";

  //
  static const getAllUsers = "$_api/get";

  //Auth
  static const signInWithId = "$_api/users/login";
  static const signUpWithPhoneAndPassword = "$_api/users/signup";
  static const getCurrentUserBytoken = "$_api/users/login-via-token";

  static const profileUpdate = "$_api/users/update-profile";

  //Room
  static const getAllRooms = "$_api/rooms/get";
  static const createNewRoom = "$_api/rooms/add-room";
  // static const deleteRoom = "$_api";
}

class SocketStrings {
  static String newUser = 'new-user';
  static String sendChatMessage = 'send-chat-message';
  static String chateMessages = 'chat-message';
}
