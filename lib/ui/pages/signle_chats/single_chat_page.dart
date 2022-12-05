// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/backgraund_widget.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';

class SigleChatPage extends StatefulWidget {
  const SigleChatPage({super.key, required this.friendId, required this.fillName, required this.profileUrl});
  final int friendId;
  final String fillName;
  final String? profileUrl;

  @override
  State<SigleChatPage> createState() => _SigleChatPageState();
}

class _SigleChatPageState extends State<SigleChatPage> {
  late List<Map<String, dynamic>> dummyChat;
  @override
  void initState() {
    dummyChat = [
      {
        "message": "hello",
        "profile": widget.profileUrl,
        "name": widget.fillName,
        "time": DateTime.now().subtract(const Duration(minutes: 5)).toString(),
        "sender_id": widget.friendId,
      },
      {
        "message": "hi",
        "profile": UserController.instance.getImage,
        "name": UserController.instance.getFirstName,
        "time": DateTime.now().subtract(const Duration(minutes: 5)).toString(),
        "sender_id": UserController.instance.getId,
      },
      {
        "message": "hello 2",
        "profile": widget.profileUrl,
        "name": widget.fillName,
        "time": DateTime.now().subtract(const Duration(minutes: 5)).toString(),
        "sender_id": widget.friendId,
      },
      {
        "message": "hi2",
        "profile": UserController.instance.getImage,
        "name": UserController.instance.getFirstName,
        "time": DateTime.now().subtract(const Duration(minutes: 5)).toString(),
        "sender_id": UserController.instance.getId,
      },
      {
        "message": "hello3",
        "profile": widget.profileUrl,
        "name": widget.fillName,
        "time": DateTime.now().subtract(const Duration(minutes: 5)).toString(),
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
        "time": DateTime.now().subtract(const Duration(minutes: 5)).toString(),
        "sender_id": widget.friendId,
      },
      {
        "message": "You can just get the string to split and create a datetime object dd/MM/YYYY. Você pode apenas pegar a string fazer um split e criar um objeto datetime com o padrão dd/MM/YYYY",
        "profile": UserController.instance.getImage,
        "name": UserController.instance.getFirstName,
        "time": DateTime.now().subtract(const Duration(minutes: 5)).toString(),
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
                  );
                },
                separatorBuilder: (context, index) {
                  // DateFormat ff = DateFormat("dd/MM/yyyy");
                  // DateTime dateTime = DateTime.parse(dummyChat[index]["time"]);
                  // print(ff.format(dateTime));
                  // if (ff.format(DateTime.now()) == ff.format(dateTime)) {
                  //   return Text(ff.format(dateTime));
                  // } else {
                  return Divider();
                  // }
                },
                itemCount: dummyChat.length,
              ),
            ),

            //Message Box
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.transparent,

                // gradient: AppColor.backgraundGradientV,
              ),
              // height: 50,
              width: double.maxFinite,
              child: Row(
                children: [
                  Expanded(child: KTextField2(hintText: "Message...")),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send_rounded,
                        color: AppColor.white,
                        size: 35,
                      ))
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
  const SingleChatCard({super.key, required this.id, required this.message, required this.profile});
  final int id;
  final String? profile;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColor.closeToPurple,
      child: (id == UserController.instance.getId)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                messageWidget(message),
                const SizedBox(width: 10),
                messageProfilePicWidget(profile),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                messageProfilePicWidget(profile),
                const SizedBox(width: 10),
                messageWidget(message),
              ],
            ),
    );
  }

  Widget messageWidget(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      constraints: BoxConstraints(maxWidth: Get.width * .6),
      decoration: BoxDecoration(
        color: AppColor.grey200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(message),
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
}
