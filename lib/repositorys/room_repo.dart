import 'package:voice_chat/controllers/room_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/room_model.dart';
import 'package:voice_chat/utils/app_utils.dart';

class RoomRepository {
  static RoomRepository instance = RoomRepository();

  //get all rooms
  getAllRooms() {
    RoomController.instance.rooms.clear();
    ApiServices.getApi(url: AppUrls.getAllRooms).then((value) {
      if (value['status'] == true) {
        RoomController.instance.getRooms(RoomModel.fromJson(value));
      } else {
        print("fial");
      }
      // for (var element in value['rooms']) {
      //   print(element[0]);
      // }
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  //create new Room
  createNewRoom({
    required String roomName,
    required String createBy,
    required String info,
  }) {
    ApiServices.postApi(url: AppUrls.createNewRoom, mapData: {
      "room_name": roomName,
      "users": null,
      "created_by": createBy,
      "info": info,
    }).then((value) {
      print(value);
      getAllRooms();
      AppUtils.showSnakBar(msg: "Room Created '$roomName'");
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  //delete room

}
