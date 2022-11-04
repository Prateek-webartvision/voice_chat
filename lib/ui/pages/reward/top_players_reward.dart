// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';

class DaysWeel extends StatefulWidget {
  const DaysWeel({
    super.key,
    required this.days,
    required this.currentTic,
    required this.onTab,
    required this.activeColor,
    required this.activeTextColor,
  });

  final List<String> days;
  final int currentTic;
  final Function(int sIndex) onTab;
  final Color activeColor;
  final Color activeTextColor;

  @override
  State<DaysWeel> createState() => _DaysWeelState();
}

class _DaysWeelState extends State<DaysWeel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: AppColor.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return dayTile(
              title: widget.days[index],
              totleLength: widget.days.length,
              activeColor: (widget.currentTic == index)
                  ? widget.activeColor
                  : AppColor.transparent,
              activeTextColor: (widget.currentTic == index)
                  ? widget.activeTextColor
                  : widget.activeColor,
              onTab: () => widget.onTab(index),
            );
          },
        ),
      ),
    );
  }

  Widget dayTile({
    required String title,
    required int totleLength,
    required Color activeColor,
    required Color activeTextColor,
    required Function onTab,
  }) {
    return InkWell(
      onTap: () => onTab(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: (Get.size.width - (32 * 2)) / 3,
        decoration: BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(title, style: TextStyle(color: activeTextColor)),
      ),
    );
  }
}
