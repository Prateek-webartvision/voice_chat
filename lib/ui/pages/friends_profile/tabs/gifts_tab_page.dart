import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';

class GiftTabPages extends StatelessWidget {
  const GiftTabPages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 160,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                color: AppColor.grey200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/room_frame.png"),
                      const SizedBox(height: 10),
                      const Text("x123456"),
                    ],
                  ),
                ),
              );
            }, childCount: 10),
          ),
        ),
      ],
    );
  }
}
