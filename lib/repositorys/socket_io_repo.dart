// ignore_for_file: avoid_print

import 'package:socket_io_client/socket_io_client.dart';
import 'package:voice_chat/controllers/message_controller.dart';
import 'package:voice_chat/data/app_urls.dart';

class SocketIoPrository {
  static SocketIoPrository? _instance;

  Socket? socket;

  SocketIoPrository.internal() {
    print("Hi socket");
    socket = io(
      AppUrls.domain,
      OptionBuilder().setTransports(["websocket"]).disableAutoConnect().build(),
    );
    socket!.connect();
    socket!.onConnect((data) => print("conneted"));
    socket!.onDisconnect((data) => print("disconnet"));
    socket!.onConnectError((err) => print("errpr; $err"));
    socket!.onError((err) => print(err));
  }

  static SocketIoPrository get instance {
    _instance ??= SocketIoPrository.internal();
    print(_instance);
    return _instance!;
  }

  // Future connect({required Function(Socket socket) connectfun}) {
  //   return  "";
  // }

  sendMessage({
    required String message,
    required String roomName,
    required String userName,
  }) {
    socket!.emit(SocketStrings.sendChatMessage, [roomName, message]);
    MessageController.instance
        .pushMessage(MessageModel(name: userName, message: message));
  }

  // sync read all messages
  chatMessages() {
    socket!.on(SocketStrings.chateMessages, (data) {
      // send message to Messgae conroller
      MessageController.instance.pushMessage(MessageModel.fromJson(data));
    });
  }

  // joining room
  joinRoom({required String roomName, required String userName}) {
    socket!.emit(SocketStrings.newUser, [roomName, userName]);
  }

  crateRoom({
    // required int userIs,
    required String roomName,
  }) {}

  roomDisconnet({required String userName}) {
    socket!.disconnect();
    socket!.dispose();
    _instance = null;
    //   socket!.emit("user-disconnected", [userName]);
    // socket!.dispose();
  }

  closeConnection() {
    socket!.dispose();
  }
}
