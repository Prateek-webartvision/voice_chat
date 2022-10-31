import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/bottom_navs/home_tabs/home_all_tab.dart';
import 'package:voice_chat/ui/pages/bottom_navs/home_tabs/home_discover_tab.dart';
import 'package:voice_chat/ui/pages/bottom_navs/home_tabs/home_game_tab.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with TickerProviderStateMixin {
  // var tabController = DefaultTabController(length: 3, child: )
  late TabController tabController;
  int currentTabPage = 0;

  List<Widget> homeTabPages = [
    const HomeGameTab(),
    const HomeDiscoverTab(),
    const HomeAllTab(),
  ];

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: currentTabPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Expanded(
                  child: TabBar(
                    // isScrollable: true,
                    controller: tabController,
                    indicatorColor: AppColor.closeToBlue,
                    labelColor: AppColor.closeToBlue,
                    unselectedLabelColor: AppColor.black54,
                    indicatorSize: TabBarIndicatorSize.label,
                    onTap: (value) {
                      setState(() {
                        currentTabPage = value;
                      });
                    },
                    tabs: const [
                      Tab(text: "Games"),
                      Tab(text: "Discover"),
                      Tab(text: "All"),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
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
                          Icons.search,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Center(
                      child: Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                            gradient: AppColor.backgraundGradient(),
                            borderRadius: BorderRadius.circular(30.r)),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.wine_bar_outlined,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(controller: tabController, children: homeTabPages),
    );
  }
}
