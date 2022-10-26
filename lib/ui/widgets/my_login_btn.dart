import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';

enum MyLoginBtnType {
  roundedIconBtn,
  gradientBtn,
}

class MyLoginBtn {
  final MyGradientBtn myGradientBtn;

  MyLoginBtn({required this.myGradientBtn});

  // const MyLoginBtn({
  //   super.key,
  //   this.bgColor,
  //   required this.icon,
  //   required this.onPress,
  //   required this.myLoginBtnType,
  //   required this.text,
  //   this.borderRadius,
  // });
  // final Color? bgColor;
  // final Icon icon;
  // final Function onPress;
  // final MyLoginBtnType myLoginBtnType;
  // final String text;
  // final double? borderRadius;

  // @override
  // Widget build(BuildContext context) {
  //   switch (myLoginBtnType) {
  //     case MyLoginBtnType.roundedIconBtn:
  //       return MyRoundedIConBtn(icon: icon, onPress: onPress, bgColor: bgColor);
  //     case MyLoginBtnType.gradientBtn:
  //       return Container();
  //   }
  // }

}

class MyGradientBtn extends StatelessWidget {
  const MyGradientBtn({
    super.key,
    required this.onPress,
    required this.text,
    this.borderRadius,
  });
  final Function onPress;
  final String text;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          gradient: AppColor.backgraundGradient(),
          boxShadow: [
            BoxShadow(
              color: AppColor.black54,
              offset: const Offset(0, 2),
              blurRadius: 1,
            )
          ]),
      child: Material(
        color: AppColor.transparent,
        child: InkWell(
          onTap: () => onPress(),
          child: Center(
              child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: AppColor.white),
          )),
        ),
      ),
    );
  }
}

class MyRoundedIConBtn extends StatelessWidget {
  const MyRoundedIConBtn({
    super.key,
    this.bgColor,
    required this.icon,
    required this.onPress,
  });
  final Color? bgColor;
  final Icon icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        height: h60,
        width: h60,
        decoration: BoxDecoration(
          color: bgColor ?? AppColor.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
