// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';

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
  List<Widget> tabPages = [InfoTabPage(), MomentsTabPage(), GadgesTabPage(), GiftTabPages()];

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
              Get.bottomSheet(Container(
                // height: 200,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        child: Text(
                          "Share",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    // Remark
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        // color: AppColor.closeToPurple,
                        alignment: Alignment.center,
                        child: Text(
                          "Remark",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    // Remove Friend
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        child: Text(
                          "Remove Friend",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),

                    // Report
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        child: Text(
                          "Report",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    // Add To block list
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        child: Text(
                          "Add to Block List",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    //Cancel btn
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        child: Text(
                          "Cancel",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black54),
                        ),
                      ),
                    ),
                  ],
                ),
                // color: Colors.green,
              ));
              return [];
              // return [
              //   PopupMenuItem(child: Text("Pop")),
              //   PopupMenuItem(child: Text("up")),
              //   PopupMenuItem(child: Text("button")),
              // ];
            },
          )
        ],
      ),

      //Body
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BgWithAvtar(),

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
                children: tabPages,
              ),
            )
          ],
        ),
      ),

      //Bottom btn
      bottomNavigationBar: Container(
        width: Get.width,
        height: 60,
        // color: AppColor.grey400,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // add friend or chat
            Container(
              width: 135,
              height: 40,
              decoration: BoxDecoration(gradient: AppColor.backgraundGradientV, borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_circle_outline_sharp, color: AppColor.white),
                  SizedBox(width: 8),
                  Text("Add Friend",
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),

            // follow and unfollow
            Container(
              width: 135,
              height: 40,
              decoration: BoxDecoration(gradient: AppColor.backgraundGradientV, borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite, color: AppColor.white),
                  SizedBox(width: 8),
                  Text("Follow",
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }
}

class GiftTabPages extends StatelessWidget {
  const GiftTabPages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 8),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 160,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                color: AppColor.grey200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/room_frame.png"),
                      SizedBox(height: 10),
                      Text("x123456"),
                    ],
                  ),
                ),
              );
            }, childCount: 10),
          ),
        ),
      ],
    );
  }
}

class GadgesTabPage extends StatelessWidget {
  const GadgesTabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 8),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                color: AppColor.grey200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/photo_frame.png"),
                ),
              );
            }, childCount: 10),
          ),
        ),
      ],
    );
  }
}

class MomentsTabPage extends StatelessWidget {
  const MomentsTabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return postCart();
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }

  Widget postCart() {
    return Container(
      color: AppColor.grey200,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Moment discreption"),
          SizedBox(height: 8),
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 6),
                  Text("123"),
                ],
              ),
              SizedBox(width: 6),
              Row(
                children: [
                  Icon(Icons.message),
                  SizedBox(width: 6),
                  Text("12"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InfoTabPage extends StatelessWidget {
  const InfoTabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: AppColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            "Bio",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black, fontSize: 14),
          ),
          SizedBox(height: h10),
          Text("this is me bio")
        ],
      ),
    );
  }
}

class BgWithAvtar extends StatelessWidget {
  const BgWithAvtar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg.jpg",
          height: 200,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            SizedBox(height: 160),
            Container(
              width: double.maxFinite,
              height: 108,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  //Avtar
                  Positioned(
                    left: 16,
                    top: -120 * .4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: AppColor.backgraundGradientV,
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        //
                        SizedBox(height: 6),
                        Text(
                          "User name",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row
                  Positioned(
                    left: 156,
                    top: 10,
                    child: Row(
                      children: [
                        //Followed
                        Column(
                          children: [
                            Text(
                              "0",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Follow",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        //Followers
                        Column(
                          children: [
                            Text(
                              "0",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
