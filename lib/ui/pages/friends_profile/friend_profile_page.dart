// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:voice_chat/controllers/friend_profile_controller.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/repositorys/friend_profile_repo.dart';
import 'package:voice_chat/res/app_color.dart';

import 'tabs/Badges_tab_page.dart';
import 'tabs/gifts_tab_page.dart';
import 'tabs/info_tab_page.dart';
import 'tabs/moment_tab_page.dart';
import 'widgets/bg_with_avatar.dart';
import 'widgets/friends_profile_bottom_btns.dart';
import 'widgets/friends_profile_bottom_sheet.dart';

class FriendProfilePage extends StatefulWidget {
  const FriendProfilePage({super.key, required this.friendId});
  final int friendId;
  @override
  State<FriendProfilePage> createState() => _FriendProfilePageState();
}

class _FriendProfilePageState extends State<FriendProfilePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final TabController _tabController;
  double appVisblity = 0.0;
  double hPadding = 16;

  @override
  void initState() {
    _tabController = TabController(length: tabBarList.length, vsync: this);
    FirendProfileRepository().getUserById(widget.friendId);
    scrollSetting();
    super.initState();
  }

  scrollSetting() {
    _scrollController.addListener(() {
      double offset;
      offset = _scrollController.offset / (_scrollController.position.maxScrollExtent * .7);
      setState(() {
        appVisblity = (offset >= 1) ? 1 : offset;
      });
    });
  }

  List<String> tabBarList = ["Info", "Moment", "Badges", "Gift"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.closeToPurple.withOpacity(appVisblity),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              Get.bottomSheet(FriendsProfileBottomSheet());
              return [];
            },
          )
        ],
      ),

      //Body
      body: GetBuilder<FriendProfileController>(
        builder: (friendData) {
          if (friendData.apiStatus == ApiStatusEnum.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (friendData.apiStatus == ApiStatusEnum.error) {
            return Center(child: Text(friendData.error!));
          } else {
            return SingleChildScrollView(
              controller: _scrollController,
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Cover Image with user info
                  BgWithAvtar(
                    coverImage: (friendData.friendProfile!.coverImage != null) ? "${ApiImagePath.cover}${friendData.friendProfile!.coverImage}" : null,
                    profileImage: (friendData.friendProfile!.image != null) ? "${ApiImagePath.profile}${friendData.friendProfile!.image}" : null,
                    userName: "${friendData.friendProfile!.firstName} ${friendData.friendProfile!.lastName}",
                    friendsCount: friendData.friendProfile!.friendsCount,
                    followersCount: friendData.friendProfile!.followersCount,
                    followingsCount: friendData.friendProfile!.followingCount,
                  ),

                  // Tab Bar
                  Container(
                    alignment: Alignment.centerLeft,
                    color: AppColor.white,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: AppColor.closeToPurple,
                      indicator: const TabBarGradientIndicator(
                        gradientColor: [AppColor.closeToBlue, AppColor.closeToPurple],
                        indicatorWidth: 3,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      tabs: tabBarList.map((e) => Tab(text: e)).toList(),
                    ),
                  ),

                  //Tab View
                  Container(
                    constraints: BoxConstraints(maxHeight: 460.h, minHeight: 200),
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      controller: _tabController,
                      children: [
                        InfoTabPage(userInfo: friendData.friendProfile!.bio),
                        MomentsTabPage(),
                        BadgesTabPage(),
                        GiftTabPages(),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),

      //Bottom btn
      bottomNavigationBar: FriendsProfileBottomBtns(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }
}
