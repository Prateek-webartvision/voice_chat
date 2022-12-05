import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';

class InfoTabPage extends StatelessWidget {
  const InfoTabPage({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  final String? userInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "Bio",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black, fontSize: 14),
          ),
          SizedBox(height: h10),
          Text(userInfo ?? "NA")
        ],
      ),
    );
  }
}
