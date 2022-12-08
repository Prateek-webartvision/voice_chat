// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/room_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/countrys_flag_imoji_model.dart';
import 'package:voice_chat/repositorys/room_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/rooms/room_page.dart';
import 'package:voice_chat/ui/widgets/main_title_with_widget.dart';

class HomeDiscoverTab extends StatefulWidget {
  const HomeDiscoverTab({super.key});

  @override
  State<HomeDiscoverTab> createState() => _HomeDiscoverTabState();
}

class _HomeDiscoverTabState extends State<HomeDiscoverTab> {
  @override
  void initState() {
    pullToRefresh();
    super.initState();
  }

  pullToRefresh() async {
    await RoomRepository.instance.getAllRooms();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => pullToRefresh(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: 20.h),
              //Populer countrys
              MainTitleWithWidget(
                title: "Most Popular Countries",
                child: const CountryGridView(),
              ),
              const SizedBox(height: 20),
              //all new rooms
              MainTitleWithWidget(
                title: "New Rooms",
                child: RoomsWidget(),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(builder: (controller) {
      if (controller.rooms == null) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.rooms!.isEmpty) {
        // if room is empty
        return Center(child: Text("No Rooms"));
      } else {
        return GridView.builder(
          itemCount: controller.rooms!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            // return Text("data ${controller.rooms}");
            return Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  Get.to(() => RoomPage(roomId: controller.rooms![index].id));
                },
                child: Container(
                  decoration: BoxDecoration(
                    //* room cord Bg image
                    image: DecorationImage(
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

                    //user
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //*Room name
                        Text(
                          controller.rooms![index].roomName,
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        //*Creater Name and avtar
                        Row(
                          children: [
                            //*avtar
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                gradient: AppColor.backgraundGradientV,
                                image: (controller.rooms![index].creatorImage != null)
                                    ? DecorationImage(
                                        image: CachedNetworkImageProvider("${ApiImagePath.profile}${controller.rooms![index].creatorImage}"),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            const SizedBox(width: 10),
                            //* room creater name
                            Expanded(
                              child: Text(
                                "${controller.rooms![index].firstName} ${controller.rooms![index].lastName}",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }
    });
  }
}

//* top counrys widget
class CountryGridView extends StatelessWidget {
  const CountryGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: GridView.builder(
        itemCount: countrysFlagEmojiList.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    countrysFlagEmojiList[index].emoji,
                    style: TextStyle(fontSize: 26.sp),
                  ),
                  Text(
                    countrysFlagEmojiList[index].name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
