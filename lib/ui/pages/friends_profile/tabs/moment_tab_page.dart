import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';

class MomentsTabPage extends StatelessWidget {
  const MomentsTabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return postCart();
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }

  Widget postCart() {
    return Container(
      color: AppColor.grey200,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Moment discreption"),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite),
                  SizedBox(width: 6),
                  Text("123"),
                ],
              ),
              const SizedBox(width: 6),
              Row(
                children: const [
                  Icon(Icons.message),
                  SizedBox(width: 6),
                  Text("12"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
