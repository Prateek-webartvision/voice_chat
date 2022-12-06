// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:voice_chat/controllers/home_controller.dart';
import 'package:voice_chat/controllers/room_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/repositorys/home_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/pages/bottom_navs/home_tabs/home_discover_tab.dart';
import 'package:voice_chat/ui/pages/rooms/room_page.dart';
import 'package:voice_chat/ui/widgets/main_title_with_widget.dart';

class HomeAllTab extends StatefulWidget {
  const HomeAllTab({super.key});

  @override
  State<HomeAllTab> createState() => _HomeAllTabState();
}

class _HomeAllTabState extends State<HomeAllTab> with TickerProviderStateMixin {
  late TabController tabController;
  bool isTranding = true;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      setState(() {
        if (tabController.index == 0) {
          isTranding = true;
        } else {
          isTranding = false;
        }
      });
      print(isTranding);
    });
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
          (isTranding == true) ? const Rooms() : const Rooms(),

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
    RoomController.instance.rooms!.shuffle();

    return GetBuilder<RoomController>(builder: (controller) {
      return SizedBox(
        height: 140,
        // child: Text("kundan"),
        child: ListView.builder(
          itemCount: controller.rooms!.length > 6 ? 6 : controller.rooms!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  Get.to(() => RoomPage(
                        room: controller.rooms![index],
                      ));
                },
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    //Room Thumb
                    image: DecorationImage(
                      // image: CachedNetworkImageProvider(
                      //     controller.rooms![index]),
                      image: const AssetImage("assets/images/bg.jpg"),
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
                            gradient: AppColor.backgraundGradientV,
                            //Avtar
                            image: (controller.rooms![index].image != null)
                                ? DecorationImage(
                                    image: CachedNetworkImageProvider("${ApiImagePath.profile}${controller.rooms![index].image}"),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "${controller.rooms![index].firstName} ${controller.rooms![index].lastName}",
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
              ),
            );
          },
        ),
      );
    });
  }
}

class Banner extends StatefulWidget {
  const Banner({super.key});

  @override
  State<Banner> createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    HomeRepository.getHomeBanner();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.banners == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.banners!.isEmpty) {
          return const SizedBox();
        } else {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: controller.banners!.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider("${ApiImagePath.banner}${controller.banners![index]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 140,
                  viewportFraction: 1,
                  autoPlay: true,
                  initialPage: pageIndex,
                  onPageChanged: (index, reason) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              AnimatedSmoothIndicator(
                activeIndex: pageIndex,
                count: controller.banners!.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: AppColor.closeToPurple.withOpacity(0.3),
                  activeDotColor: AppColor.closeToPurple,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
