import 'package:voice_chat/controllers/room_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/room_model.dart';
import 'package:voice_chat/repositorys/socket_io_repo.dart';
import 'package:voice_chat/utils/app_utils.dart';

class RoomRepository {
  static RoomRepository instance = RoomRepository();

  //get all rooms
  getAllRooms() async {
    RoomController.instance.rooms.clear();
    List<Room> rooms = [];

    await ApiServices.getApi(url: AppUrls.getAllRooms).then((value) {
      if (value['status'] == true) {
        RoomController.instance.getRooms(RoomModel.fromJson(value));
        rooms = RoomController.instance.rooms;
      } else {
        //responce error
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
        print("fial");
      }
    }).onError((error, stackTrace) {
      // error message
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });

    return rooms;
  }

  //create new Room
  createNewRoom({
    required String roomName,
    required String createBy,
    required String info,
    required String userFirstName,
    required String userLastName,
    required String userProfileImage,
    required String image,
    Function(Room room)? onCreated,
  }) async {
    await ApiServices.postApi(url: AppUrls.createNewRoom, mapData: {
      "room_name": roomName,
      "users": null,
      "created_by": createBy,
      "info": info,
      "first_name": userFirstName,
      "last_name": userLastName,
      "creator_image": userProfileImage,
    }).then((value) {
      if (value['status'] == true) {
        AppUtils.showSnakBar(msg: "Room Created '$roomName'");
        SocketIoPrository.instance.crateRoom(roomName: roomName);
        getAllRooms().then((v) {
          v.forEach((Room e) {
            if (e.roomName == roomName) {
              // sendRoom To create Room Page
              if (onCreated == null) {
                onCreated!(e);
              }
            }
          });
        });
      } else {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      }
    }).onError((error, stackTrace) {
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
      print("Form Create Room Repo $error");
    });
  }

  //delete room

}
