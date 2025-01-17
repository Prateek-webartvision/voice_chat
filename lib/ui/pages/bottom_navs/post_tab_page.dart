import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/pages/bottom_navs/post_tabs/create_post_page.dart';
import 'package:voice_chat/ui/pages/bottom_navs/post_tabs/post_friends_tab.dart';
import 'package:voice_chat/ui/pages/bottom_navs/post_tabs/post_suggested_tab.dart';

class PostTabPage extends StatefulWidget {
  const PostTabPage({super.key});

  @override
  State<PostTabPage> createState() => _PostTabPageState();
}

class _PostTabPageState extends State<PostTabPage> with TickerProviderStateMixin {
  late TabController tabController;
  int currentPage = 0;

  List<Widget> postTabPages = [
    const PostSuggestedTab(),
    const PostFriendsTab(),
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: currentPage);
    //

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          color: AppColor.grey200,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: Get.width,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TabBar
                SizedBox(
                  width: 200,
                  child: TabBar(
                    controller: tabController,
                    labelColor: AppColor.closeToPurple,
                    unselectedLabelColor: AppColor.black54,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const TabBarGradientIndicator(
                      gradientColor: [AppColor.closeToBlue, AppColor.closeToPurple],
                      indicatorWidth: 3,
                    ),
                    onTap: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    tabs: const [
                      Tab(text: "Suggested"),
                      Tab(text: "Friends"),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                //Action Btns
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        height: h30,
                        width: h30,
                        decoration: BoxDecoration(gradient: AppColor.backgraundGradient(), borderRadius: BorderRadius.circular(30.r)),
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            print("Open post");
                            Get.to(() => const CreatePostPage());
                          },
                          child: Icon(
                            Icons.camera,
                            color: AppColor.white,
                          ),
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
      // Body
      body: TabBarView(
        controller: tabController,
        children: postTabPages,
      ),
    );
  }
}
