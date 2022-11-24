// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/friend_request_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/repositorys/friend_repo.dart';
import 'package:voice_chat/res/app_color.dart';

class FriendRequestListPage extends StatefulWidget {
  const FriendRequestListPage({super.key});

  @override
  State<FriendRequestListPage> createState() => _FriendRequestListPageState();
}

class _FriendRequestListPageState extends State<FriendRequestListPage> {
  @override
  void initState() {
    FriendRepository.instance.getFriendRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Request",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColor.black),
              ),
            ),
            SizedBox(height: 20),
            GetBuilder<FriendRequestController>(
              builder: (friendReq) {
                if (friendReq.firendsmodelList == null) {
                  // ignore: prefer_const_constructors
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      friendReq.firendsmodelList?.data.requestReceived.length,
                  itemBuilder: (context, index) {
                    var rq =
                        friendReq.firendsmodelList?.data.requestReceived[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundImage: (rq!.image != null)
                            ? CachedNetworkImageProvider(
                                "${ApiImagePath.profile}${rq.image}")
                            : null,
                      ),
                      title: Text("${rq.firstName} ${rq.lastName}"),
                      trailing: Container(
                        decoration: BoxDecoration(
                            gradient: AppColor.backgraundGradientV,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Accept",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
