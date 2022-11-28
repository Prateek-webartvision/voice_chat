import 'package:get/get.dart';

class SocketIoController extends GetxController {
  static SocketIoController instance = Get.find<SocketIoController>();
  List<String> socketRoomMessages = [];

  pushRoomMessages(String message) {
    socketRoomMessages.add(message);
    update();
  }
}
