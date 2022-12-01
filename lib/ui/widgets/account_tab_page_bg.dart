import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/res/app_color.dart';

class AccountTabPageBg extends StatelessWidget {
  const AccountTabPageBg({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: GetBuilder<UserController>(builder: (userController) {
                return Container(
                  decoration: BoxDecoration(
                    // color: AppColor.closeToPurple,
                    gradient: AppColor.backgraundGradientV,
                    image: (userController.getCoverImage != null)
                        ? DecorationImage(
                            image: CachedNetworkImageProvider("${ApiImagePath.cover}${userController.getCoverImage}"),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                );
              }),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: AppColor.grey200,
              ),
            ),
          ],
        ),
        child ?? const SizedBox()
      ],
    );
  }
}
