// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/socket_io_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/room_model.dart';
import 'package:voice_chat/repositorys/socket_io_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/backgraund_widget.dart';
// import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/utils/app_utils.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key, required this.room});
  final RoomModel room;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  TextEditingController message = TextEditingController();
  // late Socket socket;
  // Socket? socket;

  // initSocket() {
  //   print("object");

  //   socket = io(
  //       // AppUrls.domain,
  //       "https://apichatapp.webartvision.in",
  //       // "https://vc-app.herokuapp.com/",
  //       OptionBuilder().setTransports(['websocket', 'polling']).build());
  //   socket!.connect();
  //   socket!.onConnect((_) {
  //     print('Connection established');
  //     socket!.emit("chat message", "hello world");
  //   });

  //   socket!.on("chat message", (data) {
  //     print("$data");
  //   });

  //   socket!.onDisconnect((_) => print('Connection Disconnection'));
  //   socket!.onConnectError((err) => print("errpr; $err"));
  //   socket!.onError((err) => print(err));
  // }

  @override
  void initState() {
    // initSocket();
    SocketIoPrository.instance.connect();
    SocketIoPrository.instance.socket!.on('chat message', (data) {
      SocketIoController.instance.addMessages(data);
    });
    super.initState();
  }
  //web socket working on

  @override
  void dispose() {
    // socket.disconnect();
    SocketIoPrository.instance.closeConnection();
    // socket.dispose();
    super.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    return AuthBackgraundWidget(
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        body: Column(
          children: [
            //CustumAppBar
            RoomAppBar(
                name: widget.room.userName, userImage: widget.room.userProfile),
            //Room header
            RoomHeaderUsers(testImage: widget.room.userProfile),
            //Chat List
            Flexible(child: GetBuilder<SocketIoController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.socketMessages.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          controller.socketMessages[index],
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: AppColor.black),
                        ));
                  },
                );
              },
            )),

            //chat text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Gift
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      gradient: AppColor.backgraundGradientV,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("Gift");
                      },
                      child: Icon(
                        Icons.card_giftcard,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("favorite");
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("favorite");
                      },
                      child: Icon(
                        Icons.gamepad_rounded,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("favorite");
                      },
                      child: Icon(
                        Icons.chat_outlined,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("favorite");
                      },
                      child: Icon(
                        Icons.mic,
                        color: AppColor.white,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      // print("object");
                      // socket!.emit("chat message", "hello world");
                      Get.bottomSheet(Container(
                        // height: 100,
                        color: AppColor.white,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flexible(
                                child: KTextField2(
                              hintText: "message",
                              textEditingController: message,
                            )),
                            SizedBox(width: 20),
                            IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () {
                                //socket messgaing
                                if (message.text.isEmpty) {
                                  print("send");
                                  AppUtils.showSnakBar(msg: "Enter message");
                                } else {
                                  SocketIoPrository.instance
                                      .sendMessage(message.text);

                                  if (Get.isBottomSheetOpen == true) {
                                    message.clear();
                                    Get.back();
                                  }
                                }
                              },
                            )
                          ],
                        ),
                      ));
                    },
                    child: Container(
                      height: 35,
                      // width: 35,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // gradient: AppColor.backgraundGradientV,
                        color: AppColor.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text("Write a message...      "),
                    ),
                  ),
                ],
              ),
            ),
            // Center(child: Text(room.userName)),
          ],
        ),
      ),
    );
  }
}

class RoomHeaderUsers extends StatelessWidget {
  const RoomHeaderUsers({
    Key? key,
    this.testImage,
  }) : super(key: key);
  final String? testImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
            image: CachedNetworkImageProvider(
                "https://www.texassampling.com/wp-content/uploads/2014/04/bokeh-cover-bg.jpg"),
            fit: BoxFit.cover),
      ),
      child: GridView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / .78,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColor.white,
                    width: 1.5,
                  ),
                  image: (index == 9)
                      ? DecorationImage(
                          image: CachedNetworkImageProvider(testImage ??
                              "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"),
                          fit: BoxFit.cover)
                      : null,
                ),
                child: (index == 9)
                    ? Container()
                    : Icon(
                        Icons.mic_none_rounded,
                        color: AppColor.white,
                      ),
              ),
              SizedBox(height: 6),
              Text(
                (index == 9) ? "user name" : "${index + 1}",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class RoomAppBar extends StatelessWidget {
  const RoomAppBar({super.key, this.userImage, required this.name});
  final String? userImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //user side
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Avtar
                  Row(
                    children: [
                      //image
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          gradient: AppColor.backgraundGradientV,
                          image: (userImage != null)
                              ? DecorationImage(
                                  image: CachedNetworkImageProvider(userImage!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      SizedBox(width: 10),
                      //name number
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "154955634",
                            style: TextStyle(
                              color: AppColor.white54,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),

                  //Troffi
                  Row(
                    children: [
                      Icon(
                        Icons.wine_bar_outlined,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "1254",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  )
                ],
              )
              // viewers side
              ,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    // runSpacing: 10,
                    spacing: 8,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.white,
                        foregroundImage: (userImage != null)
                            ? CachedNetworkImageProvider(userImage!)
                            : null,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.white,
                        foregroundImage: (userImage != null)
                            ? CachedNetworkImageProvider(userImage!)
                            : null,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.white,
                        foregroundImage: (userImage != null)
                            ? CachedNetworkImageProvider(userImage!)
                            : null,
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Text(
                    "5",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
