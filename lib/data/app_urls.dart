class AppUrls {
  // static const String domain = "http://apichatapp.webartvision.in";
  // static const String domain = "http://199.192.24.175:3000";
  static const String domain = "http://192.168.0.234:3000";
  static const String _api = "$domain/api";

  //
  static const String getAllUsers = "$_api/get";

  //Auth
  static const String signInWithId = "$_api/users/login";
  static const String signUpWithPhoneAndPassword = "$_api/users/signup";
  static const String getCurrentUserBytoken = "$_api/users/login-via-token";

  static const String profileUpdate = "$_api/users/update-profile";

  //Post
  static const String createPost = "$_api/posts/add-post";

  //Room
  static const String getAllRooms = "$_api/rooms/get";
  static const String createNewRoom = "$_api/rooms/add-room";
  // static const deleteRoom = "$_api";
}

class SocketStrings {
  static String newUser = 'new-user';
  static String sendChatMessage = 'send-chat-message';
  static String chateMessages = 'chat-message';
}
