import 'package:flutter/material.dart';

class KAppBar {
  static homeAppBar() {
    return PreferredSize(
        child: HomeAppBar(), preferredSize: Size.fromHeight(50));
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      color: Colors.green,
      child: SafeArea(
          child: Row(
        children: [Text("data")],
      )),
    );
  }
}
