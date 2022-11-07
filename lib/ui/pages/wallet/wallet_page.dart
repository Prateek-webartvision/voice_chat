// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    _controller.addListener(_handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey200,
      appBar: AppBar(
        backgroundColor: AppColor.grey200,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.black),
        centerTitle: true,
        title: Text(
          "Wallet",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Tab bar and Card
            Container(
              clipBehavior: Clip.hardEdge,
              height: 180,
              decoration: BoxDecoration(
                color: AppColor.closeToPurple,
                gradient: AppColor.backgraundGradientV,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  TabBar(
                    controller: _controller,
                    indicatorColor: AppColor.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    // onTap: (value) {
                    //   setState(() {
                    //     currentPage = value;
                    //   });
                    // },
                    tabs: [
                      Tab(text: "Gold"),
                      Tab(text: "Diamond"),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      // color: AppColor.closeToBlue,
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              //Invoice page
                              print("invoces");
                            },
                            child: Text(
                              "Invoice details",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColor.white),
                            ),
                          ),
                          (_currentIndex == 0)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "My Gold",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(color: AppColor.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "0",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: AppColor.white),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.monetization_on,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "My Diamond",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(color: AppColor.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "0",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: AppColor.white),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.diamond,
                                          color: AppColor.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ), //Tabs
            Expanded(
                child: TabBarView(
              controller: _controller,
              children: <Widget>[
                goldPage(),
                daimondPage(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  _handleTabSelection() {
    // if (_controller.indexIsChanging) {
    setState(() {
      _currentIndex = _controller.index;
      // print(_currentIndex);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Daimonds
  bool isGooglePlayOpen = true;
  Widget daimondPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () {
                setState(() {
                  isGooglePlayOpen = !isGooglePlayOpen;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/google_pay.png",
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Expanded(child: Text("Google Pay")),
                    SizedBox(width: 10),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          (isGooglePlayOpen == true)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.diamond_rounded,
                              color: AppColor.closeToBlue,
                              size: 40,
                            ),
                            Text("123456"),
                            Container(
                              height: 30,
                              width: double.maxFinite,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  gradient: AppColor.backgraundGradientV,
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Text("1234",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: AppColor.white)),
                            )
                          ]),
                    );
                  },
                )
              : Container(
                  child: Text("Close"),
                ),
        ],
      ),
    );
  }

//Gold
  Widget goldPage() {
    return Stack(
      children: [
        Positioned(
          top: 25,
          left: 8,
          right: 8,
          child: Text(
            "The gold coin received upon receiving the gift are 30% of the Value of the gift sent",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.black54),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 8,
          right: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: MyGradientBtn(
              onPress: () {},
              text: "Diamond Exchange",
              borderRadius: 100,
            ),
          ),
        ),
      ],
    );
  }
}
