// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/store/store_page.dart';

class MyCollectiblesPage extends StatefulWidget {
  const MyCollectiblesPage({super.key});

  @override
  State<MyCollectiblesPage> createState() => _MyCollectiblesPageState();
}

class _MyCollectiblesPageState extends State<MyCollectiblesPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: storeTabsName.length, vsync: this);
    super.initState();
  }

  final List<Widget> _pages = [
    Center(child: Text("No ${storeTabsName[0]}")),
    Center(child: Text("No ${storeTabsName[1]}")),
    Center(child: Text("No ${storeTabsName[2]}")),
    Center(child: Text("No ${storeTabsName[3]}")),
    Center(child: Text("No ${storeTabsName[4]}")),
    Center(child: Text("No ${storeTabsName[5]}")),
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
          "My Collectibles",
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
      //Tab Bar View
      body: TabBarView(controller: tabController, children: _pages),
    );
  }
}
