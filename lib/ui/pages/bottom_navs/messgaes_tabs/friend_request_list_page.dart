// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/friend_request_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/friend_model.dart';
import 'package:voice_chat/repositorys/friend_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/utils/app_utils.dart';

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
      backgroundColor: AppColor.grey200,
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
                  return Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                if (friendReq.firendsmodelList!.data.requestReceived.isEmpty) {
                  return Expanded(child: Center(child: Text("No Request")));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount:
                      friendReq.firendsmodelList?.data.requestReceived.length,
                  itemBuilder: (context, index) {
                    return requestReceivedCard(
                        req: friendReq
                            .firendsmodelList!.data.requestReceived[index],
                        onRespond: () {
                          // on respond
                          Get.dialog(Center(
                            child: Material(
                                color: AppColor.transparent,
                                child: Container(
                                  width: Get.width * .9,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Respond",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium!
                                                    .copyWith(
                                                        color: AppColor.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                              onPressed: () {
                                                AppUtils.closeDailog();
                                              },
                                              icon: Icon(Icons.close),
                                            ),
                                          )
                                        ],
                                      ),
                                      //Btns
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            //reject
                                            Container(
                                              decoration: BoxDecoration(
                                                gradient: AppColor
                                                    .backgraundGradientV,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: InkWell(
                                                onTap: () => reject(
                                                    requestById: friendReq
                                                        .firendsmodelList!
                                                        .data
                                                        .requestReceived[index]
                                                        .id),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 16),
                                                  child: Text(
                                                    "reject",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium!
                                                        .copyWith(fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //Accept
                                            Container(
                                              decoration: BoxDecoration(
                                                gradient: AppColor
                                                    .backgraundGradientV,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: InkWell(
                                                //
                                                onTap: () => accept(
                                                    requestById: friendReq
                                                        .firendsmodelList!
                                                        .data
                                                        .requestReceived[index]
                                                        .id),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 16),
                                                  child: Text(
                                                    "accept",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium!
                                                        .copyWith(fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ), //
                                    ],
                                  ),
                                )),
                          ));
                        });
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  // friend request card
  Widget requestReceivedCard(
      {required RequestReceived req, required Function() onRespond}) {
    return ListTile(
      tileColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      //avtar
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: AppColor.backgraundGradientV,
          image: (req.image != null)
              ? DecorationImage(
                  image: CachedNetworkImageProvider(
                      "${ApiImagePath.profile}${req.image}"),
                  fit: BoxFit.cover)
              : null,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      //user name
      title: Text("${req.firstName} ${req.lastName}".capitalize!),

      // respond Btn
      trailing: Container(
        decoration: BoxDecoration(
          gradient: AppColor.backgraundGradientV,
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onRespond,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              "Respond",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  void accept({required int requestById}) {
    AppUtils.closeDailog();
    FriendRepository.instance
        .respondFriendRequest(accept: true, requestedById: requestById)
        .then((value) {
      if (value != null) {
        FriendRepository.instance.getFriendRequest();
      }
    });
  }

  void reject({required int requestById}) {
    AppUtils.closeDailog();
    FriendRepository.instance
        .respondFriendRequest(accept: false, requestedById: requestById)
        .then((value) {
      if (value != null) {
        FriendRepository.instance.getFriendRequest();
      }
    });
  }
}
