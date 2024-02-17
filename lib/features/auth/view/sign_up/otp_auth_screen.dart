import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/components/app_backbutton.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/pin_otp_field.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/features/auth/view/sign_up/id_screen.dart';

class OtpAuthScreen extends StatefulWidget {
  const OtpAuthScreen({super.key});

  @override
  State<OtpAuthScreen> createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimension.ylenght * 6),

            // Back Button
            const AppBackButton(),

            SizedBox(height: Dimension.ylenght * 5),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Verify it's you",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 10.h),

                // Welcome
                TextWidget(
                  text:
                      "We send a code to ( *****@mail.com ). Enter it here to verify your identity",
                  fontSize: 16.sp,
                  textColor: SmartpayColors.greyColor,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                ),

                SizedBox(height: Dimension.ylenght * 3),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PinOTPFieldWidget(
                      width: 300.w,
                      controller: controller,
                      length: 5,
                      textColor: SmartpayColors.blackColor,
                      activeColor: SmartpayColors.greyColor.withOpacity(0.1),
                      activeFillColor:
                          SmartpayColors.greyColor.withOpacity(0.1),
                      inactiveColor: SmartpayColors.greyColor,
                      selectedFillColor: SmartpayColors.primaryColor,
                    ),

                    // Resend
                    SizedBox(height: Dimension.ylenght * 4),
                    TextWidget(
                      text: "Resend Code 30 secs",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xff727272),
                    ),

                    // Button
                    SizedBox(height: Dimension.ylenght * 4),

                    AppButton(
                      onClick: () => navigate(
                        context,
                        const IdScreen(),
                      ),
                      text: "Confirm",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
