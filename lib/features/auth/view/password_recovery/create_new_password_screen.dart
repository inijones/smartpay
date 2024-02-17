import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/components/app_backbutton.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Spacing
            SizedBox(height: Dimension.ylenght * 6),

            // Back Button
            const AppBackButton(),

            SizedBox(height: Dimension.ylenght * 4),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Create New Password",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),

                SizedBox(height: 10.h),

                // Welcome
                TextWidget(
                  text:
                      "Please, enter a new password below different from the previous password",
                  fontSize: 16.sp,
                  textColor: SmartpayColors.greyColor,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                ),
              ],
            ),

            SizedBox(height: Dimension.ylenght * 5),

            TextField(),

            SizedBox(height: Dimension.ylenght * 3),

            TextField(),

            SizedBox(height: Dimension.ylenght * 28),

            AppButton(
              width: double.infinity,
              onClick: () {},
              text: "Create new password",
            ),
          ],
        ),
      ),
    );
  }
}
