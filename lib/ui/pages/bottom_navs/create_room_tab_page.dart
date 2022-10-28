import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';

class CreateRoomTabPage extends StatelessWidget {
  const CreateRoomTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.closeToRed,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            //Text field
            KTextField2(
              hintText: "Room Name",
              fillColor: AppColor.grey200.withOpacity(0.5),
            ),
            const SizedBox(height: 10),
            //Dowpdown
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: AppColor.grey200.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Room Type",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_circle,
                    color: AppColor.white,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //mic
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColor.white, width: 1)),
                  child: Icon(
                    Icons.mic,
                    color: AppColor.white,
                  ),
                ),
                //record
                Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(50),
                    // border: Border.all(color: AppColor.white, width: 1),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(50),
                        border:
                            Border.all(color: AppColor.closeToRed, width: 2)),
                  ),
                ),
                //chat
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColor.white, width: 1)),
                  child: Icon(
                    Icons.chat,
                    color: AppColor.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
