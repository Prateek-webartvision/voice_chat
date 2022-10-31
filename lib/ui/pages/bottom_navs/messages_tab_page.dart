import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/res/app_color.dart';

class MessagesTabPage extends StatelessWidget {
  const MessagesTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Messages",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColor.black),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(),
                    ListTile(
                      leading: Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.people,
                          color: Colors.teal,
                        ),
                      ),
                      title: const Text("Following"),
                      subtitle: const Text("People's Following Requests"),
                      trailing: const Text(""),
                    ),
                    ListTile(
                      leading: Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.mail,
                          color: AppColor.closeToPurple,
                        ),
                      ),
                      title: const Text("System Messages"),
                      subtitle: const Text("Notification From Admins"),
                      trailing: const Text("15:30"),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: const Text("No messages"),
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
