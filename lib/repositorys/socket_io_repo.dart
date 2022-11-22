// ignore_for_file: avoid_print

import 'package:socket_io_client/socket_io_client.dart';
import 'package:voice_chat/controllers/message_controller.dart';
import 'package:voice_chat/data/app_urls.dart';

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

  Future<void> connect() async {
    socket!.connect();
    socket!.onConnect((data) => print("connected"));
    socket!.onDisconnect((data) => print("disconnet"));
    socket!.onConnectError((err) => print("errpr; $err"));
    socket!.onError((err) => print(err));
  }

  sendMessage({
    String? profilePic,
    required String message,
    required String roomName,
    required String userName,
  }) {
    // TODO message socket add images
    socket!.emit(SocketStrings.sendChatMessage, [roomName, message]);
    MessageController.instance.pushMessage(
        MessageModel(name: userName, message: message, profilePic: profilePic));
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

  roomDisconnet() {
    socket!.disconnect();
    socket!.dispose();
  }

  closeConnection() {
    socket!.dispose();
  }
}
