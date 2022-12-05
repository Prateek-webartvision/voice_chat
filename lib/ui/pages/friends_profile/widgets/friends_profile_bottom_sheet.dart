import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';

class FriendsProfileBottomSheet extends StatelessWidget {
  const FriendsProfileBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                "Share",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black),
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          // Remark
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: double.maxFinite,
              // color: AppColor.closeToPurple,
              alignment: Alignment.center,
              child: Text(
                "Remark",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black),
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          // Remove Friend
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                "Remove Friend",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red),
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),

          // Report
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                "Report",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red),
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          // Add To block list
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                "Add to Block List",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red),
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          //Cancel btn
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                "Cancel",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black54),
              ),
            ),
          ),
        ],
      ),
      // color: Colors.green,
    );
  }
}
