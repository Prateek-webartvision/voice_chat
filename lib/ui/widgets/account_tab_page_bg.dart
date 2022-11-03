import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';

class AccountTabPageBg extends StatelessWidget {
  const AccountTabPageBg({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.closeToPurple,
                  gradient: AppColor.backgraundGradientV,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: AppColor.grey200,
              ),
            ),
          ],
        ),
        child ?? const SizedBox()
      ],
    );
  }
}
