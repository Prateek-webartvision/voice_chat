// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:voice_chat/controllers/friend_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/friends_models/friend_user_model.dart';
import 'package:voice_chat/repositorys/friend_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/friends_profile/friend_profile_page.dart';

class FriendFollowPage extends StatefulWidget {
  const FriendFollowPage({super.key});

  @override
  State<FriendFollowPage> createState() => _FriendFollowPageState();
}

class _FriendFollowPageState extends State<FriendFollowPage> with TickerProviderStateMixin {
  late TabController _tabController;

  List<String> tabList = ["Friends", "Following", "Followers"];
  int tabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: tabList.length, vsync: this);
    FriendRepository.instance.getFriendsAndFollowers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey200,
      appBar: AppBar(
        backgroundColor: AppColor.grey200,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.black),
        centerTitle: true,
        title: Text(
          "Contects",
          style: TextStyle(color: AppColor.black),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColor.closeToPurple,
          unselectedLabelColor: AppColor.black54,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: TabBarGradientIndicator(
            gradientColor: [
              AppColor.closeToBlue,
              AppColor.closeToPurple,
            ],
            indicatorWidth: 3,
          ),
          tabs: tabList
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: GetBuilder<FriendsController>(builder: (friendController) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: (friendController.friendsAndFollowersData == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(
                  controller: _tabController,
                  children: [
                    //Friends Tab
                    (friendController.friendsAndFollowersData!.friends.isEmpty)
                        ? Center(
                            child: Text("No Friends"),
                          )
                        : ListView.separated(
                            itemCount: friendController.friendsAndFollowersData!.friends.length,
                            itemBuilder: (context, index) {
                              return friendUserTile(
                                friendController.friendsAndFollowersData!.friends[index],
                                isFriendsTab: true,
                                onTab: () {
                                  // print("Is friend ${friendController.friendsAndFollowersData!.friends[index].id}");
                                  Get.to(() => FriendProfilePage(friendId: friendController.friendsAndFollowersData!.friends[index].id));
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1.5,
                              );
                            },
                          ),

                    //Following Tab
                    (friendController.friendsAndFollowersData!.followings.isEmpty)
                        ? Center(
                            child: Text("No Following"),
                          )
                        : ListView.separated(
                            itemCount: friendController.friendsAndFollowersData!.followings.length,
                            itemBuilder: (context, index) {
                              return friendUserTile(
                                friendController.friendsAndFollowersData!.followings[index],
                                isFollowingTab: true,
                                onTab: () {
                                  Get.to(() => FriendProfilePage(friendId: friendController.friendsAndFollowersData!.followings[index].id));
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1.5,
                              );
                            },
                          ),
                    //Follower Tab
                    (friendController.friendsAndFollowersData!.followers.isEmpty)
                        ? Center(
                            child: Text("No Followers"),
                          )
                        : ListView.separated(
                            itemCount: friendController.friendsAndFollowersData!.followers.length,
                            itemBuilder: (context, index) {
                              return friendUserTile(
                                friendController.friendsAndFollowersData!.followers[index],
                                onTab: () {
                                  Get.to(() => FriendProfilePage(friendId: friendController.friendsAndFollowersData!.followings[index].id));
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1.5,
                              );
                            },
                          ),
                  ],
                ),
        );
      }),
    );
  }

  // Friend Tile
  Widget friendUserTile(
    FriendUserModel friendUserData, {
    bool? isFriendsTab = false,
    bool? isFollowingTab = false,
    Function()? onTab,
  }) {
    return ListTile(
      onTap: onTab,
      //Image
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.green,
          gradient: AppColor.backgraundGradientV,
          borderRadius: BorderRadius.circular(20),
          image: (friendUserData.image != null)
              ? DecorationImage(
                  image: CachedNetworkImageProvider("${ApiImagePath.profile}${friendUserData.image}"),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
      //name
      title: Text("${friendUserData.firstName} ${friendUserData.lastName}"),
      trailing: (isFriendsTab == true)
          ? InkWell(
              //unfirend
              onTap: () => FriendRepository.instance.unFriend(friendUserData.id),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColor.closeToPurple,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.delete,
                  color: AppColor.white,
                ),
              ),
            )
          : (isFollowingTab == true)
              ? InkWell(
                  //unfollow
                  onTap: () async {
                    await FriendRepository.instance.unfollow(friendUserData.id).then((v) {
                      if (v != null) {
                        FriendsController.instance.unfollow(friendUserData.id);
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColor.closeToPurple,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text("Unfollow", style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 12)),
                  ),
                )
              : InkWell(
                  onTap: () {
                    // print("Remove follower");
                    FriendRepository.instance.removeFollower(friendUserData.id);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColor.closeToPurple,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text("Remove", style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 12)),
                  ),
                ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
