import 'package:get/get.dart';
import 'package:voice_chat/controllers/user_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    // implement dependencies
  }
}
