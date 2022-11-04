// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/reward/tabs/room_tab.dart';
import 'package:voice_chat/ui/widgets/backgraund_widget.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgraundWidget(
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        body: Column(
          children: [
            //App bar
            RewardAppBar(tabController: tabController),
            //Top Players and all players
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  RoomTab(),
                  RoomTab(),
                  RoomTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RewardAppBar extends StatelessWidget {
  const RewardAppBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: AppColor.backgraundGradientV),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.white,
              ),
            ),
            Expanded(
              child: TabBar(
                controller: tabController,
                labelColor: AppColor.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: TabBarGradientIndicator(
                  gradientColor: [
                    AppColor.closeToBlue,
                    AppColor.closeToPurple,
                  ],
                  indicatorWidth: 3,
                ),
                tabs: [
                  Tab(
                    text: "Rooms",
                  ),
                  Tab(
                    text: "Karizma",
                  ),
                  Tab(
                    text: "Contribution",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
