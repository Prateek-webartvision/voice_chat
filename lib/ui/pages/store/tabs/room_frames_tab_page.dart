import 'package:flutter/material.dart';
import 'package:voice_chat/ui/pages/store/widget/store_card_widget.dart';

class RoomFramesTabPage extends StatelessWidget {
  const RoomFramesTabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return StoreCardWidget(
          image: "assets/images/room_frame.png",
          index: index,
        );
      },
    );
  }
}
