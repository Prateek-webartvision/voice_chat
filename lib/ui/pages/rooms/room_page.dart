// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/message_controller.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/room_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/room_model.dart';
import 'package:voice_chat/repositorys/room_repo.dart';
import 'package:voice_chat/repositorys/socket_io_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/backgraund_widget.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/utils/app_utils.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key, required this.roomId});
  final int roomId;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  TextEditingController message = TextEditingController();
  final SocketIoPrository mySocket = SocketIoPrository.instance;
  // MessageController? messageController;

  @override
  void initState() {
    MessageController.instance.messages.clear();
    // RoomController.instance.clearRoomChat();
    // getUser();
    init();
    super.initState();
  }

  init() async {
    await RoomRepository.instance.getRoomByid(widget.roomId);
    mySocket.connect();
    mySocket.roomChatMessage(widget.roomId);
    mySocket.onDis();
  }

  // get current user and connect to socker
  // getUser() {
  //   MessageController.instance.messages.clear();

  //   print(widget.room.creatorImage);

  //   mySocket.connect();

  //   mySocket.joinRoom(
  //     roomName: widget.room.roomName,
  //     userName: "${UserController.instance.getFirstName} ${UserController.instance.getLastName}",
  //   );

  //   // // read messages
  //   mySocket.chatMessages();
  // }

  @override
  void dispose() {
    mySocket.roomDisconnet();
    message.dispose();
    super.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    return AuthBackgraundWidget(
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        body: GetBuilder<RoomController>(
          builder: (controller) {
            if (controller.currentRoom == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  //CustumAppBar
                  RoomAppBar(
                    name: "${controller.currentRoom!.firstName} ${controller.currentRoom!.lastName}",
                    userImage: controller.currentRoom!.creatorImage,
                  ),
                  //Room header
                  RoomHeaderUsers(testImage: null),

                  // //Chat List
                  Flexible(
                    child: GetBuilder<MessageController>(
                      builder: (controller) {
                        if (controller.messages.isEmpty) {
                          return Center(
                              child: Text(
                            "No Messages",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ));
                        } else {
                          return ListView.builder(
                            itemCount: controller.messages.length,
                            itemBuilder: (context, index) {
                              return RoomChatCard(
                                messages: controller.messages[index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),

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
                                        AppUtils.showSnakBar(msg: "Enter message");
                                      } else {
                                        SocketIoPrository.instance.sendRoomChatMessage(controller.currentRoom!.id, message.text);
                                        //   SocketIoPrository.instance.sendMessage(
                                        //     roomName: widget.room.roomName,
                                        //     message: message.text,
                                        //     profilePic: UserController.instance.getImage,
                                        //     userName: "${ProfileController.instance.profileData!.firstName} ${ProfileController.instance.profileData!.lastName}",
                                        //   );

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
                  // // Center(child: Text(room.userName)),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

//Messages chard
class RoomChatCard extends StatelessWidget {
  const RoomChatCard({
    Key? key,
    required this.messages,
  }) : super(key: key);
  final RoomMessageModel messages;

  @override
  Widget build(BuildContext context) {
    if (messages.msg == "conncet") {
      return connectAndDisConnect(context);
    } else if (messages.msg == "disconnet") {
      return connectAndDisConnect(context);
    } else {
      return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            // color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      gradient: AppColor.backgraundGradientV,
                      borderRadius: BorderRadius.circular(15),
                      image: (messages.profilePic != null)
                          ? DecorationImage(
                              image: CachedNetworkImageProvider("${ApiImagePath.profile}${messages.profilePic!}"),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(messages.name, style: TextStyle(color: AppColor.white, fontSize: 10)),
                ],
              ),
              SizedBox(height: 6),
              Text(
                messages.message,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColor.white,
                      fontSize: 16,
                    ),
              ),
            ],
          ));
    }
  }

  Widget connectAndDisConnect(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              messages.name,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColor.white,
                    fontSize: 12,
                  ),
            ),
            Text(
              messages.message,
              style: Theme.of(context).textTheme.headlineSmall,
            )
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
        image: DecorationImage(image: CachedNetworkImageProvider("https://www.texassampling.com/wp-content/uploads/2014/04/bokeh-cover-bg.jpg"), fit: BoxFit.cover),
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
                          image: CachedNetworkImageProvider(testImage ?? "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"), fit: BoxFit.cover)
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
                                  image: CachedNetworkImageProvider("${ApiImagePath.profile}$userImage"),
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
                        // foregroundImage: (userImage != null)
                        //     ? CachedNetworkImageProvider(userImage!)
                        //     : null,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.white,
                        // foregroundImage: (userImage != null)
                        //     ? CachedNetworkImageProvider(userImage!)
                        //     : null,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.white,
                        // foregroundImage: (userImage != null)
                        //     ? CachedNetworkImageProvider(userImage!)
                        //     : null,
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
