// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.productInfo});
  final Map<String, dynamic> productInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.grey200,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.black),
        centerTitle: true,
        title: Text("Payment", style: TextStyle(color: AppColor.black)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 20),
            Image.asset(
              productInfo['image'],
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 25),
            Text(productInfo['name'], style: TextStyle(color: AppColor.black, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("\$ ${productInfo['price']}", style: TextStyle(color: AppColor.black, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            Container(
              // height: 40,
              width: Get.width * .7,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.grey200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(children: [Expanded(child: Text("Choose Payment method")), Icon(Icons.arrow_drop_down_rounded)]),
            ),
            const SizedBox(height: 50),
            SizedBox(width: Get.width * .7, child: MyGradientBtn(onPress: () {}, text: "Continue"))
          ],
        ),
      )),
    );
  }
}
