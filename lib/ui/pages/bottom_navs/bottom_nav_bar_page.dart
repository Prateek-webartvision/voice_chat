import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/bottom_navs/account_tab_page.dart';
import 'package:voice_chat/ui/pages/bottom_navs/create_room_tab_page.dart';
import 'package:voice_chat/ui/pages/bottom_navs/home_tab_page.dart';
import 'package:voice_chat/ui/pages/bottom_navs/messages_tab_page.dart';
import 'package:voice_chat/ui/pages/bottom_navs/post_tab_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int currentPage = 0;

  List<Widget> tabPages = [
    const HomeTabPage(),
    const PostTabPage(),
    const MessagesTabPage(),
    const AccountTabPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabPages[currentPage],
      bottomNavigationBar: ConvexAppBar(
        height: 55,
        elevation: 0,
        color: AppColor.grey400,
        style: TabStyle.fixedCircle,
        initialActiveIndex: currentPage,
        backgroundColor: AppColor.white,
        activeColor: AppColor.closeToPurple,
        onTap: (index) {
          setState(() {
            switch (index) {
              case 0:
                currentPage = 0;
                break;
              case 1:
                currentPage = 1;
                break;
              case 2:
                //Create Post Nav
                Get.to(() => const CreateRoomTabPage());
                break;
              case 3:
                currentPage = 2;
                break;
              case 4:
                currentPage = 3;
                break;
            }
          });
        },
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.post_add, title: 'Post'),
          TabItem(icon: Icons.mic),
          TabItem(icon: Icons.message, title: 'Messages'),
          TabItem(icon: Icons.person, title: 'My Account'),
        ],
      ),
    );
  }
}
