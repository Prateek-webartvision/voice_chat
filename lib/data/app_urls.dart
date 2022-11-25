class AppUrls {
  // static const String domain = "http://apichatapp.webartvision.in";
  // static const String domain = "http://199.192.24.175:3000"; // web
  static const String domain = "http://192.168.0.234:3000"; //pc
  // static const String domain = "http://192.168.162.247:3000"; //phone
  static const String _api = "$domain/api";

  //
  static const String getAllUsers = "$_api/get";

  //Auth and user
  static const String signInWithId = "$_api/users/login";
  static const String signUpWithPhoneAndPassword = "$_api/users/signup";
  static const String getCurrentUserBytoken = "$_api/users/login-via-token";

  static const String profileUpdate = "$_api/users/update-profile";
  static const String profileUpdateNew = "$_api/users/profile-upload";

  //Post
  static const String createPost = "$_api/posts/add-post";
  static const String getAllPost = "$_api/posts/get";
  static const String addPostComment = "$_api/posts/add-comment";
  static const String addPostlike = "$_api/posts/add-like";

  //friends
  static const String sendFriendRequest = "$_api/friends/request-friendship";
  static const String getFriendsRquestList = "$_api/friends/get-request-list";

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

class ApiImagePath {
  static const String profile = "${AppUrls.domain}/media/profiles/";
  static const String post = "${AppUrls.domain}/media/posts/";
}
