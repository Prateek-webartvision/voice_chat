import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/res/app_color.dart';

class StoreCardWidget extends StatelessWidget {
  const StoreCardWidget({
    Key? key,
    required this.image,
    required this.index,
  }) : super(key: key);
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            //
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    image,
                    height: 80.h,
                  ),
                  const Text("frame name"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.diamond_rounded,
                        size: 12,
                        color: AppColor.closeToBlue,
                      ),
                      SizedBox(width: 8),
                      Text("15326",
                          style: TextStyle(
                              color: AppColor.closeToBlue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      print("frames $index");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      decoration: BoxDecoration(
                        gradient: AppColor.backgraundGradientV,
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      child: Text(
                        "buy",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColor.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // days
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                  gradient: AppColor.backgraundGradientV,
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("15",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColor.white)),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.calendar_today,
                    color: AppColor.white,
                    size: 12,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
