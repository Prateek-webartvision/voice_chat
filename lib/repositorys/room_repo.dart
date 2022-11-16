import 'package:flutter/cupertino.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';

class RoomRepository {
  static RoomRepository instance = RoomRepository();

  //get all rooms
  getAllRooms() {
    ApiServices.getApi(url: AppUrls.getAllRoom).then((value) {
      print(value['rooms']);
      // for (var element in value['rooms']) {
      //   print(element[0]);
      // }
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  //create new Room
  createNewRoom({required String roomName}) {
    ApiServices.postApi(url: AppUrls.createNewRoom, mapData: {"room": roomName})
        .then((value) {
      print(value);
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  //delete room

}
