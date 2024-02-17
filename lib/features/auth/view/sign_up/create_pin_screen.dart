import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartpay/common/components/app_backbutton.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/pin_otp_field.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  //controller
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
                  text: "Set your PIN Code",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 10.h),

                // Welcome
                TextWidget(
                  text: "Create your PIN code to secure your account",
                  fontSize: 16.sp,
                  textColor: SmartpayColors.greyColor,
                  fontWeight: FontWeight.w400,
                ),

                SizedBox(height: Dimension.ylenght * 3),

                // Pin
                PinOTPFieldWidget(
                  controller: controller,
                  length: 5,
                  shape: PinCodeFieldShape.underline,
                ),

                SizedBox(height: Dimension.ylenght * 6),

                AppButton(
                  width: double.infinity,
                  onClick: () {},
                  text: "Sign In",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
