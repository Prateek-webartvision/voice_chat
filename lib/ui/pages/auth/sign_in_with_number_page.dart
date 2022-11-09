import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/app_logo_widget.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/ui/widgets/privacy_policy_text_widget.dart';
import 'package:voice_chat/utils/app_utils.dart';

class SignInWithNumberPage extends StatefulWidget {
  const SignInWithNumberPage({super.key});

  @override
  State<SignInWithNumberPage> createState() => _SignInWithNumberPageState();
}

class _SignInWithNumberPageState extends State<SignInWithNumberPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController phonePinCodeController = TextEditingController();

  String countryCode = "🇮🇳 +91";
  bool isCodeview = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.black),
        backgroundColor: AppColor.white,
        centerTitle: true,
        elevation: 0,
        title: Text("SignIn", style: TextStyle(color: AppColor.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: h30),
            const AppLogoWidget(),
            SizedBox(height: h30),
            Text(
              "SignIn & SignUp",
              style: textTheme.headlineMedium!.copyWith(color: AppColor.black),
            ),
            SizedBox(height: h10),
            SizedBox(
              width: 260,
              child: Text(
                "Plaase enter your Phone number to get the verification code to login to your entity chat",
                style:
                    textTheme.headlineSmall!.copyWith(color: AppColor.black54),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: h30),
            // Phone
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: (isCodeview == true)
                  //Code View
                  ? pinCode(context)
                  //Phone Text Field
                  : Row(
                      children: [
                        Container(
                          height: 55,
                          width: 70.w,
                          // padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: AppColor.grey200,
                              borderRadius: BorderRadius.circular(16)),
                          child: InkWell(
                            onTap: () => showCountryPicker(
                              context: context,
                              onSelect: (value) {
                                setState(() {
                                  countryCode =
                                      "${value.flagEmoji} +${value.phoneCode}";
                                });
                              },
                            ),
                            child: Center(
                              child: Text(countryCode),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        SizedBox(
                          width: 248.w,
                          child: KTextField2(
                            textEditingController: phoneNumberController,
                            textInputType: TextInputType.phone,
                            hintText: "Enter Phone number",
                          ),
                        )
                      ],
                    ),
            ),
            SizedBox(height: h10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: (isCodeview == true)
                  //Code View Text
                  ? const CodeViewText()
                  : Text(
                      "Tap Next to receive an SMS confirmation. message and data rates may apply.",
                      style: GoogleFonts.roboto(color: AppColor.black54),
                      textAlign: TextAlign.center,
                    ),
            ),
            SizedBox(height: h30),
            //Next btn
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: MyGradientBtn(
                  onPress: () => nextBtn(phoneNumber: phoneNumberController),
                  text: "Next",
                  borderRadius: 40),
            )
            // KTextField(hintText: "Phone number")
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Center(
          child: SizedBox(
            width: 200,
            // child: Text.rich(
            //   style: GoogleFonts.roboto(
            //     color: AppColor.black,
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   textAlign: TextAlign.center,
            //   TextSpan(
            //     text: "You agree to the",
            //     children: [
            //       TextSpan(
            //         text: " terms of use ",
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             AppUtils.showSnakBar("Terms of use");
            //           },
            //         style: TextStyle(color: AppColor.closeToBlue),
            //       ),
            //       const TextSpan(text: "and"),
            //       TextSpan(
            //         text: " privacy policy",
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             AppUtils.showSnakBar("Privacy policy");
            //           },
            //         style: TextStyle(color: AppColor.closeToBlue),
            //       ),
            //     ],
            //   ),
            // ),
            child: PrivacyPolicyTextWidget(textColor: AppColor.black),
          ),
        ),
      ),
    );
  }

  Widget pinCode(BuildContext context) {
    return PinCodeTextField(
      controller: phonePinCodeController,
      keyboardType: TextInputType.number,
      appContext: context,
      length: 6,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        borderWidth: 1,
        activeFillColor: Colors.green,
        selectedFillColor: AppColor.closeToPurple,
        activeColor: AppColor.closeToPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      onChanged: (value) {
        print(value);
      },
    );
  }

  nextBtn({required TextEditingController phoneNumber}) {
    if (phoneNumber.text.isEmpty) {
      AppUtils.showSnakBar(
        msg: "Enter Phone Number",
      );
    } else {
      if (isCodeview == false) {
        print(phoneNumber.text);
        setState(() {
          isCodeview = true;
        });
      } else {
        print("pinCode: ${phonePinCodeController.text}");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // phonePinCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}

class CodeViewText extends StatelessWidget {
  const CodeViewText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}
