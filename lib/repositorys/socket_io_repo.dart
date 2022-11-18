// ignore_for_file: avoid_print

import 'package:socket_io_client/socket_io_client.dart';
import 'package:voice_chat/controllers/message_controller.dart';
import 'package:voice_chat/data/app_urls.dart';

class SocketIoPrository {
  static SocketIoPrository instance = SocketIoPrository();

  Socket? socket;

  // init
  initSocket() {
    socket = io(
      AppUrls.domain,
      OptionBuilder().setTransports(["websocket"]).disableAutoConnect().build(),
    );
  }

  //connect
  connect() {
    socket!.connect();
    socket!.onConnect((data) {
      print("conneted");
    });
    socket!.onDisconnect((data) => print("disconnet"));
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print("errpr; $err"));
    socket!.onError((err) => print(err));
  }

  sendMessage(
      {required String message,
      required String roomName,
      required String userName}) {
    socket!.emit(SocketStrings.sendChatMessage, [roomName, message]);
    MessageController.instance
        .pushMessage(MessageModel(name: userName, message: message));
  }

  chatMessages() {
    socket!.on(SocketStrings.chateMessages, (data) {
      // print(data);
      // send message to Messgae conroller
      MessageController.instance.pushMessage(MessageModel.fromJson(data));
    });
  }

  joinRoom({required String roomName, required String userName}) {
    socket!.emit(SocketStrings.newUser, [roomName, userName]);
  }

  crateRoom({
    // required int userIs,
    required String roomName,
    // required String type,
    // required String info,
  }) {
    print("from socket.io $roomName");
    socket!.emit('room-created', roomName);
  }

  roomDisconnet() {
    socket!.disconnect();
    socket!.dispose();
  }

  closeConnection() {
    // socket!.close();

    socket!.dispose();
  }
}
