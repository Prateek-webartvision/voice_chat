import 'package:get/get.dart';

class RoomMessageController extends GetxController {
  static RoomMessageController instance = Get.find<RoomMessageController>();
  List<RoomMessageModel> messages = [];
  List<RoomConnectedUser> allConnectedUsers = [];

  //update chat messages
  pushMessage(RoomMessageModel data) {
    messages.add(data);
    update();
  }

  pushCoonectedUsers(List<RoomConnectedUser> data) {
    allConnectedUsers = data;
    update();
  }

  // clearMessage() {
  //   messages;
  // }
}

class RoomConnectedUser {
  final int id;
  final String fillName;
  String? profileImage;

  RoomConnectedUser({
    required this.id,
    required this.fillName,
    required this.profileImage,
  });
}

class RoomMessageModel {
  final String message;
  final String name;
  String? profilePic;
  final String? msg;

  RoomMessageModel({required this.name, required this.message, this.profilePic, this.msg});

  // factory RoomMessageModel.fromJson(Map<String, dynamic> map) {
  //   // print();
  //   return RoomMessageModel(
  //     name: map['name'],
  //     profilePic: null,
  //     message: map['message'],
  //     msg: "chat",
  //   );
  // }
}
