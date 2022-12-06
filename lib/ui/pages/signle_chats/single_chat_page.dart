import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/backgraund_widget.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/utils/app_utils.dart';

class SigleChatPage extends StatefulWidget {
  const SigleChatPage({super.key, required this.friendId, required this.fillName, required this.profileUrl});
  final int friendId;
  final String fillName;
  final String? profileUrl;

  @override
  State<SigleChatPage> createState() => _SigleChatPageState();
}

class _SigleChatPageState extends State<SigleChatPage> {
  bool isReplying = false;
  String replayMessage = '';
  late List<Map<String, dynamic>> dummyChat;
  @override
  void initState() {
    dummyChat = [
      {
        "message": "hello",
        "profile": widget.profileUrl,
        "name": widget.fillName,
        "time": DateTime.now().subtract(const Duration(minutes: 30)).toString(),
        "sender_id": widget.friendId,
      },
      {
        "message": "hi",
        "profile": UserController.instance.getImage,
        "name": UserController.instance.getFirstName,
        "time": DateTime.now().subtract(const Duration(minutes: 29)).toString(),
        "sender_id": UserController.instance.getId,
      },
      {
        "message": "hello 2",
        "profile": widget.profileUrl,
        "name": widget.fillName,
        "time": DateTime.now().subtract(const Duration(minutes: 20)).toString(),
        "sender_id": widget.friendId,
      },
      {
        "message": "hi2",
        "profile": UserController.instance.getImage,
        "name": UserController.instance.getFirstName,
        "time": DateTime.now().subtract(const Duration(minutes: 15)).toString(),
        "sender_id": UserController.instance.getId,
      },
      {
        "message": "hello3",
        "profile": widget.profileUrl,
        "name": widget.fillName,
        "time": DateTime.now().subtract(const Duration(minutes: 10)).toString(),
        "sender_id": widget.friendId,
      },
      {
        "message": "hi3",
        "profile": UserController.instance.getImage,
        "name": UserController.instance.getFirstName,
        "time": DateTime.now().subtract(const Duration(minutes: 5)).toString(),
        "sender_id": UserController.instance.getId,
      },
      {
        "message": "hello4",
        "profile": widget.profileUrl,
        "name": widget.fillName,
        "time": DateTime.now().subtract(const Duration(minutes: 2)).toString(),
        "sender_id": widget.friendId,
      },
      {
        "message": "You can just get the string to split and create a datetime object dd/MM/YYYY. Você pode apenas pegar a string fazer um split e criar um objeto datetime com o padrão dd/MM/YYYY",
        "profile": UserController.instance.getImage,
        "name": UserController.instance.getFirstName,
        "time": DateTime.now().toString(),
        "sender_id": UserController.instance.getId,
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgraundWidget(
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          titleSpacing: -10,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // User avater
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  gradient: AppColor.backgraundGradientV,
                  borderRadius: BorderRadius.circular(50),
                  image: (widget.profileUrl == null)
                      ? null
                      : DecorationImage(
                          image: CachedNetworkImageProvider("${ApiImagePath.profile}${widget.profileUrl}"),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 8),
              //User Full name
              Text(
                widget.fillName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )
            ],
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text("Somthing"),
                  )
                ];
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                itemBuilder: (context, index) {
                  return SingleChatCard(
                    id: dummyChat[index]["sender_id"],
                    message: dummyChat[index]["message"],
                    profile: dummyChat[index]["profile"],
                    time: dummyChat[index]['time'],
                    onReply: (message) {
                      print(message);
                      setState(() {
                        isReplying = true;
                        replayMessage = message;
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: dummyChat.length,
              ),
            ),

            //Message Box
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.transparent,

                // gradient: AppColor.backgraundGradientV,
              ),
              // height: 50,
              width: double.maxFinite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: isReplying,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(child: Text(replayMessage)),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isReplying = false;
                                    });
                                  },
                                  child: const Icon(Icons.close, size: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                        Visibility(visible: isReplying, child: const SizedBox(height: 6)),
                        const KTextField2(hintText: "Message..."),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send_rounded,
                      color: AppColor.white,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleChatCard extends StatelessWidget {
  const SingleChatCard({
    super.key,
    required this.id,
    required this.message,
    required this.profile,
    required this.time,
    required this.onReply,
  });
  final int id;
  final String? profile;
  final String message;
  final String time;
  final Function(String message) onReply;

  @override
  Widget build(BuildContext context) {
    Duration duration = DateTime.now().difference(DateTime.parse(time));
    String? chatTime;
    if (duration.inSeconds < 60) {
      chatTime = "just now";
    } else if (duration.inSeconds >= 60 || duration.inHours < 1) {
      chatTime = "${duration.inMinutes} min";
    } else {
      chatTime = DateTime.parse(time).toString();
    }
    return Container(
      // color: AppColor.closeToPurple,
      child: (id == UserController.instance.getId)
          // my chat
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    messageWidget(message),
                    const SizedBox(width: 10),
                    messageProfilePicWidget(profile),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  chatTime,
                  style: TextStyle(color: AppColor.white, fontSize: 12),
                ),
              ],
            )
          //her/ his chat
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    messageProfilePicWidget(profile),
                    const SizedBox(width: 10),
                    messageWidget(message),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  chatTime,
                  style: TextStyle(color: AppColor.white, fontSize: 12),
                ),
              ],
            ),
    );
  }

  Widget messageWidget(String message) {
    return InkWell(
      onLongPress: () => Get.dialog(sigleChatDaiog()),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        constraints: BoxConstraints(maxWidth: Get.width * .6),
        decoration: BoxDecoration(
          color: AppColor.grey200,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(message),
      ),
    );
  }

  Widget messageProfilePicWidget(String? profile) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        gradient: AppColor.backgraundGradientV,
        borderRadius: BorderRadius.circular(20),
        image: (profile == null)
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider("${ApiImagePath.profile}$profile"),
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget sigleChatDaiog() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Material(
          color: AppColor.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  title: Text("Reply", style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.reply_rounded, color: AppColor.black),
                  onTap: () {
                    Get.back();
                    onReply(message);
                  }),
              const Divider(thickness: 1.5),
              ListTile(
                title: Text("Copy", style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.copy, color: AppColor.black),
                onTap: copyText,
              ),
              const Divider(thickness: 1.5),
              ListTile(
                title: const Text("Delete", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.delete, color: Colors.red),
                onTap: () {
                  Get.back();
                  AppUtils.showSnakBar(msg: "Delte");
                },
              ),
              // Text(message),
            ],
          ),
        ),
      ),
    );
  }

  copyText() async {
    await Clipboard.setData(ClipboardData(text: message)).then((value) {
      Get.back();
      AppUtils.showSnakBar(msg: "Copyed");
    });
  }
}
