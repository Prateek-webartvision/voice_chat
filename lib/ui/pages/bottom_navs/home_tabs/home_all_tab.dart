// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/pages/bottom_navs/home_tabs/home_discover_tab.dart';
import 'package:voice_chat/ui/widgets/main_title_with_widget.dart';

class HomeAllTab extends StatefulWidget {
  const HomeAllTab({super.key});

  @override
  State<HomeAllTab> createState() => _HomeAllTabState();
}

class _HomeAllTabState extends State<HomeAllTab> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 20.h),
          Banner(),
          SizedBox(height: 20.h),
          MainTitleWithWidget(
            title: "Fixed Room",
            onTab: () {
              print("Fixed Room");
            },
            child: HomeAllFixedRoom(),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                    color: AppColor.closeToRed,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  labelColor: AppColor.white,
                  unselectedLabelColor: AppColor.black,
                  tabs: [
                    Tab(text: "Trend"),
                    Tab(text: "Following"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: h10,
          ),
          Rooms(),

          // TabBarView(
          //     controller: tabController,
          //     children: [Text("data"), Text("data")]),

          SizedBox(height: h30),
        ],
      )),
    );
  }
}

class HomeAllFixedRoom extends StatelessWidget {
  const HomeAllFixedRoom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/117935323/original/ff84d06b328e419ee1d23bb05f0350c330a2c75e/create-a-unique-and-professional-youtube-gaming-thumbnail.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    AppColor.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                "https://indiater.com/wp-content/uploads/2021/06/free-cover-banner-for-season-x-fortnite-game-psd-template-scaled.jpg"),
            fit: BoxFit.cover,
          )),
    );
  }
}
