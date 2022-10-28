// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/bottom_navs/post_tabs/post_friends_tab.dart';
import 'package:voice_chat/ui/pages/bottom_navs/post_tabs/post_suggested_tab.dart';

class PostTabPage extends StatefulWidget {
  const PostTabPage({super.key});

  @override
  State<PostTabPage> createState() => _PostTabPageState();
}

class _PostTabPageState extends State<PostTabPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  int currentPage = 0;

  List<Widget> postTabPages = [
    PostSuggestedTab(),
    PostFriendsTab(),
  ];

  @override
  void initState() {
    tabController =
        TabController(length: 2, vsync: this, initialIndex: currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          color: AppColor.grey200,
          height: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: Get.width,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: TabBar(
                    // isScrollable: true,
                    controller: tabController,
                    indicatorColor: AppColor.closeToRed,
                    labelColor: AppColor.closeToRed,
                    unselectedLabelColor: AppColor.black54,
                    indicatorSize: TabBarIndicatorSize.label,
                    onTap: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    tabs: [
                      Tab(text: "Suggested"),
                      Tab(text: "Friends"),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                            gradient: AppColor.backgraundGradient(),
                            borderRadius: BorderRadius.circular(30.r)),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.camera,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    // SizedBox(width: 10),
                    // Center(
                    //   child: Container(
                    //     height: 30.h,
                    //     width: 30.h,
                    //     decoration: BoxDecoration(
                    //         gradient: AppColor.backgraundGradient(),
                    //         borderRadius: BorderRadius.circular(30.r)),
                    //     alignment: Alignment.center,
                    //     child: Icon(
                    //       Icons.wine_bar_outlined,
                    //       color: AppColor.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(controller: tabController, children: postTabPages),
    );
  }
}
