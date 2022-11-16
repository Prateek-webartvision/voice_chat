import 'package:socket_io_client/socket_io_client.dart';
import 'package:voice_chat/controllers/socket_io_controller.dart';

class SocketIoPrository {
  static SocketIoPrository instance = SocketIoPrository();

  Socket? socket;
  // final skurl = "https://vc-app.herokuapp.com/";
  final skurl = "http://199.192.24.175:3000/";

  // init
  initSocket() {
    socket = io(
      skurl,
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
    //  socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print("errpr; $err"));
    socket!.onError((err) => print(err));
  }

  sendMessage(String message) {
    socket!.emit('chat message', message);
  }

  closeConnection() {
    // socket!.close();
    socket!.disconnect();
    socket!.dispose();
  }
}
