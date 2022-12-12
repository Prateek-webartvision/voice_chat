// ignore_for_file: avoid_print

import 'package:socket_io_client/socket_io_client.dart';
import 'package:voice_chat/controllers/message_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/utils/app_utils.dart';

class SocketIoPrository {
  static SocketIoPrository? _instance;
  Socket? socket;

  SocketIoPrository.internal() {
    socket = io(
      AppUrls.domain,
      OptionBuilder().setTransports(["websocket"]).disableAutoConnect().build(),
    );
  }

  static SocketIoPrository get instance {
    _instance ??= SocketIoPrository.internal();
    return _instance!;
  }

  //* connect to socket server
  Future<void> connect() async {
    socket!.connect();
    socket!.onConnect((data) {
      print("connected");
    });
    // socket!.onDisconnect((data) => print("disconnet"));
    socket!.onConnectError((err) => print("errpr; $err"));
    socket!.onError((err) => print(err));
  }

  //* disconnetUSer
  disconnetUSer({required int roomis, required String name}) {
    socket!.onDisconnect((data) {
      socket!.emit("dis", [roomis, name]);
      print("Dis");
    });
  }

  //*Send message in room
  sendRoomChatMessage(int roomId, String message) {
    ApiServices.postApi(url: AppUrls.roomSendMessage, mapData: {
      "roomid": roomId,
      "token": UserController.instance.getToken,
      "message": message,
    }).then((value) {
      //
      if (value['status'] == true) {
        print("Res: $value");
      } else {
        AppUtils.showSnakBar(msg: value['status'], second: 2);
      }
    }).onError((error, stackTrace) {
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  roomChatMessage(int roomid) {
    socket!.on("room-message", (data) {
      print(data);
      if (roomid == data["room_id"]) {
        MessageController.instance.pushMessage(
          RoomMessageModel(name: "${data["first_name"]} ${data["last_name"]}", message: data["message"], profilePic: data['sender_image'], msg: "chat"),
        );
      }
    });

    // user join room
    socket!.on(SocketStrings.userConnected, (data) {
      // MessageController.instance.pushMessage(RoomMessageModel(message: "Join Room", msg: "conncet", name: data));
      print(data);
    });

    // user leave room
    socket!.on(SocketStrings.userDisconnect, (data) {
      // print(data);
      // MessageController.instance.pushMessage(RoomMessageModel(message: "Room Leaved", msg: "disconnet", name: data));
      print("test $data");
    });
  }

  // joining room
  joinRoom({required String roomName, required String userName}) {
    socket!.emit(SocketStrings.newUser, [roomName, userName]);
  }

  // sendMessage({
  //   String? profilePic,
  //   required String message,
  //   required String roomName,
  //   required String userName,
  // }) {
  //   socket!.emit(SocketStrings.sendChatMessage, [roomName, message]);
  //   MessageController.instance.pushMessage(RoomMessageModel(name: userName, message: message, profilePic: profilePic, msg: "chat"));
  // }

  // // sync read all messages
  // chatMessages() {
  //   socket!.on(SocketStrings.chateMessages, (data) {
  //     print("Caht: $data");
  //     // send message to Messgae conroller
  //     // MessageController.instance.pushMessage(RoomMessageModel.fromJson(data));
  //   });

  //   socket!.on(SocketStrings.userConnected, (data) {
  //     MessageController.instance.pushMessage(RoomMessageModel(message: "Join Room", msg: "conncet", name: data));
  //     print(data);
  //   });

  //   socket!.on(SocketStrings.userDisconnect, (data) {
  //     MessageController.instance.pushMessage(RoomMessageModel(message: "Room Leaved", msg: "disconnet", name: data));
  //     print(data);
  //   });
  // }

  // crateRoom({
  //   // required int userIs,
  //   required String roomName,
  // }) {}

  // //single get user lesion
  // sigleGetChatFriendData(int friendId) {
  //   //get friend data
  // }

  // //set friends data
  // singleSetChatFriendData(Map data) {
  //   // setData
  // }

  // //single chat join lisean
  // singleGetChatJoin() {
  //   // join chat
  // }

  // //single chat message lisean
  // singleGetChatMessage() {
  //   // get messages
  // }
  // // single chat setMessage
  // signleSetChatMessage() {}

  roomDisconnet() {
    socket!.disconnect();
    socket!.dispose();
  }
}
