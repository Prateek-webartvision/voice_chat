import 'package:get/get.dart';

class SocketIoController extends GetxController {
  static SocketIoController instance = Get.find<SocketIoController>();
  List<String> socketMessages = [];

  addMessages(String message) {
    socketMessages.add(message);
    update();
  }
}
