import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/models/room_model.dart';
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
          //Banner
          const Banner(),
          SizedBox(height: 20.h),
          // Fixed Room
          MainTitleWithWidget(
            title: "Fixed Room",
            onTab: () {
              //TODO add see more
              print("Fixed Room");
            },
            child: const HomeAllFixedRoom(),
          ),
          SizedBox(height: 20.h),
          //tab bar
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                    color: AppColor.closeToPurple,
                    gradient: AppColor.backgraundGradient(),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  labelColor: AppColor.white,
                  unselectedLabelColor: AppColor.black,
                  tabs: const [
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
          const Rooms(),

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
    rooms.shuffle();

    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: rooms.length > 6 ? 6 : rooms.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                //Room Thumb
                image: DecorationImage(
                  image: CachedNetworkImageProvider(rooms[index].roomThum),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    AppColor.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
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
                        //Avtar
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              rooms[index].userProfile),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        rooms[index].userName,
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
          image: const DecorationImage(
            image: CachedNetworkImageProvider(
                "https://indiater.com/wp-content/uploads/2021/06/free-cover-banner-for-season-x-fortnite-game-psd-template-scaled.jpg"),
            fit: BoxFit.cover,
          )),
    );
  }
}
