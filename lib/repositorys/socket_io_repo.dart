import 'package:socket_io_client/socket_io_client.dart';
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
    print("object");
    socket!.connect();
    socket!.onConnect((data) {
      print("conneted");
    });
    socket!.onDisconnect((data) => print("disconnet"));
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print("errpr; $err"));
    socket!.onError((err) => print(err));
  }

  sendMessage(String message) {
    socket!.emit('chat message', message);
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

  closeConnection() {
    // socket!.close();
    socket!.disconnect();
    socket!.dispose();
  }
}
