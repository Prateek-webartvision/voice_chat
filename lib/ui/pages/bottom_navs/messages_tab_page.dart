// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/friend_controller.dart';
import 'package:voice_chat/repositorys/friend_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/bottom_navs/messgaes_tabs/friend_request_list_page.dart';

class MessagesTabPage extends StatefulWidget {
  const MessagesTabPage({super.key});

  @override
  State<MessagesTabPage> createState() => _MessagesTabPageState();
}

class _MessagesTabPageState extends State<MessagesTabPage> {
  @override
  void initState() {
    FriendRepository.instance.getFriendRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Messages",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black),
            ),
          ),
          //body
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // message tile
                    GetBuilder<FriendsController>(builder: (friendsController) {
                      return ListTile(
                        onTap: () => Get.to(() => FriendRequestListPage()),
                        leading: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.people,
                            color: Colors.teal,
                          ),
                        ),
                        title: const Text("Following"),
                        subtitle: const Text("People's Following Requests"),
                        trailing: (friendsController.firendsmodelList != null)
                            ? (friendsController.firendsmodelList!.data.requestReceived.isNotEmpty)
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(15)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      friendsController.firendsmodelList!.data.requestReceived.length.toString(),
                                      style: TextStyle(color: AppColor.white, fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : SizedBox()
                            : SizedBox(),
                      );
                    }),

                    //System message
                    ListTile(
                      leading: Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.mail,
                          color: AppColor.closeToPurple,
                        ),
                      ),
                      title: const Text("System Messages"),
                      subtitle: const Text("Notification From Admins"),
                      trailing: const Text("15:30"),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: const Text("No messages"),
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
