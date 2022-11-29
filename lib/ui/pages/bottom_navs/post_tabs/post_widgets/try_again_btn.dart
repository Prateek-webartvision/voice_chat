import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';

class TryAgainBtn extends StatelessWidget {
  const TryAgainBtn({
    Key? key,
    required this.onTab,
  }) : super(key: key);

  final Function() onTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(color: AppColor.closeToBlue, borderRadius: BorderRadius.circular(20)),
        child: Text(
          "try again".capitalize!,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
