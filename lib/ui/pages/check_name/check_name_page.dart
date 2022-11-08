import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';

class CheckNamePage extends StatelessWidget {
  const CheckNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.grey200,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.black),
        centerTitle: true,
        title: Text(
          "Check Name",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 30),
            Text(
              "Search for agency",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColor.black54),
            ),
            SizedBox(height: 10),
            KTextField2(
              hintText: "Type Agency ID",
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.go,
              onSubmit: (value) {
                print(value);
              },
              prefixIcon: Icon(Icons.search),
            )
          ],
        ),
      )),
    );
  }
}
