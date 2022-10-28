// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class KAppBar {
  static homeAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: HomeAppBar(),
    );
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
        children: const [
          Text("data"),
        ],
      )),
    );
  }
}
