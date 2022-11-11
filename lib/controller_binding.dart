import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_controller.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/room_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(ProfileController());
    Get.put(PostController());
    Get.put(RoomController());
    // implement dependencies
  }
}
