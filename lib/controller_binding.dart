import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:voice_chat/controllers/friend_request_controller.dart';
import 'package:voice_chat/controllers/message_controller.dart';
import 'package:voice_chat/controllers/post_controller.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/room_controller.dart';
import 'package:voice_chat/controllers/socket_io_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(ProfileController());
    Get.put(PostController());
    Get.put(RoomController());
    Get.put(SocketIoController());
    Get.put(MessageController());
    Get.put(FriendRequestController());
    // implement dependencies
  }
}
