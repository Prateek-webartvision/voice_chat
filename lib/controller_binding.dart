import 'package:get/get.dart';
import 'package:voice_chat/controllers/friend_controller.dart';
import 'package:voice_chat/controllers/friend_profile_controller.dart';
import 'package:voice_chat/controllers/home_controller.dart';
import 'package:voice_chat/controllers/room_message_controller.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/room_controller.dart';
import 'package:voice_chat/controllers/socket_io_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(ProfileController());
    // Get.put(PostSuggestedController());
    Get.put(RoomController());
    Get.put(SocketIoController());
    Get.put(RoomMessageController());
    Get.put(FriendsController());
    Get.put(HomeController());
    Get.put(FriendProfileController());
    // implement dependencies
  }
}
