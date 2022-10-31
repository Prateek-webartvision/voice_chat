import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/res/app_color.dart';

class MainTitleWithWidget extends StatelessWidget {
  const MainTitleWithWidget({
    super.key,
    required this.title,
    required this.onTab,
    this.child,
  });
  final String title;
  final Function onTab;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColor.closeToPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.star,
                      color: AppColor.white,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => onTab(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "more",
                    style: TextStyle(color: AppColor.closeToPurple),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      gradient: AppColor.backgraundGradient(),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.white,
                      size: 16,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        child ?? Container(),
      ],
    );
  }
}
