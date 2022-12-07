import 'package:get/get.dart';
import 'package:voice_chat/models/room_model.dart';

class RoomController extends GetxController {
  static RoomController instance = Get.find<RoomController>();

  List<Room>? rooms;
  List<Room>? fixRooms;
  Room? currentRoom;

  getRooms(RoomModel roomData) {
    rooms = roomData.rooms;
    update();
  }

  setRoomData(Room room) {
    currentRoom = room;
    update();
  }
}
