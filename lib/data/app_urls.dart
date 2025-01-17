class AppUrls {
  // static const String domain = "http://apichatapp.webartvision.in";
  static const String domain = "http://199.192.24.175:3000"; // web
  // static const String domain = "http://192.168.0.234:3000"; //pc
  // static const String domain = "http://192.168.162.247:3000"; //phone
  static const String _api = "$domain/api";

  //
  static const String getAllUsers = "$_api/get";

  //Auth and user
  static const String signInWithId = "$_api/users/login";
  static const String signUpWithPhoneAndPassword = "$_api/users/signup";
  static const String getCurrentUserBytoken = "$_api/users/login-via-token";

  static const String getUserProfileById = "$_api/users/get-profile";

  //Home
  static const String homeBanner = "$_api/gallery/app-banners";

  //Profile
  static const String profileUpdate = "$_api/users/update-profile";
  static const String profileUpdateNew = "$_api/users/profile-upload";
  static const String profileCoverUpdate = "$_api/users/cover-upload";

  //Post
  static const String getAllPost = "$_api/posts/get";
  static const String getAllPost2 = "$_api/posts/get-all";
  static const String getMyFriendsPost = "$_api/posts/get-my-friends-post";
  static const String getPostByUserId = "$_api/posts/get-post-by-userid";
  static const String createPost = "$_api/posts/add-post";
  static const String removePost = "$_api/posts/remove-post";
  static const String addPostComment = "$_api/posts/add-comment";
  static const String remocePostComment = "$_api/posts/remove-comment";
  static const String addPostlike = "$_api/posts/add-like";

  //friends
  static const String sendFriendRequest = "$_api/friends/request-friendship";
  static const String getFriendsRquestList = "$_api/friends/get-request-list";
  static const String respondFriendRequest = "$_api/friends/response-friendship";
  static const String getFriendsAndFolloersList = "$_api/friends/get-friendship-list";
  static const String unFriend = "$_api/friends/remove-friendship";

  //followers
  static const String followFriend = "$_api/followers/request-follow";
  static const String unfollow = "$_api/followers/request-unfollow";
  static const String removefollower = "$_api/followers/request-removefollower";

  //Room
  static const String getAllRooms = "$_api/rooms/get";
  static const String getRoomById = "$_api/rooms/get-v2/";
  static const String createNewRoom = "$_api/rooms/add-room";
  static const String roomSendMessage = "$_api/rooms/chat";

  // static const deleteRoom = "$_api";
}

class SocketStrings {
  static String newUser = 'new-user';
  static String userConnected = "user-connected";
  static String userDisconnect = "user-disconnected";

  // static String roomMessage = "room-message";

  static String sendChatMessage = 'send-chat-message';
  static String chateMessages = 'chat-msg';
}

class ApiImagePath {
  static const String profile = "${AppUrls.domain}/media/profiles/";
  static const String cover = "${AppUrls.domain}/media/covers/";
  static const String post = "${AppUrls.domain}/media/posts/";
  static const String banner = "${AppUrls.domain}/media/gallery/";
}
