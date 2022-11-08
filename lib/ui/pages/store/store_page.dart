// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:voice_chat/res/app_color.dart';

import 'tabs/effects_tab_page.dart';
import 'tabs/frames_tab_page.dart';
import 'tabs/room_frames_tab_page.dart';
import 'widget/store_card_widget.dart';

final List<String> storeTabsName = [
  "Frames",
  "Effects",
  "Room Frames",
  "Chat bubbles",
  "Entering effects",
  "Room wallpaper",
];

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: storeTabsName.length, vsync: this);
    super.initState();
  }

  final List<Widget> _pages = [
    FramesTabPage(),
    EffectsTabPage(),
    RoomFramesTabPage(),
    ChatBubblesTabPage(),
    Center(child: Text("Entering effects")),
    Center(child: Text("Room wallpaper")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.grey200,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.black),
        centerTitle: true,
        title: Text(
          "Store",
          style: TextStyle(color: AppColor.black),
        ),
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          labelColor: AppColor.closeToPurple,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: TabBarGradientIndicator(
            gradientColor: [AppColor.closeToBlue, AppColor.closeToPurple],
            indicatorWidth: 6,
          ),
          unselectedLabelColor: AppColor.black54,
          tabs: storeTabsName.map((e) => Tab(text: e.toUpperCase())).toList(),
        ),
      ),
      //tabs
      body: TabBarView(controller: tabController, children: _pages),
    );
  }
}

class ChatBubblesTabPage extends StatelessWidget {
  const ChatBubblesTabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return StoreCardWidget(
          image: "assets/images/room_frame.png",
          index: index,
        );
      },
    );
  }
}
