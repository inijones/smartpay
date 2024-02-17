import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/components/app_backbutton.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/features/auth/view/sign_up/create_pin_screen.dart';

class IdScreen extends StatefulWidget {
  const IdScreen({super.key});

  @override
  State<IdScreen> createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Spacing
            SizedBox(height: Dimension.ylenght * 6),

            // Back Button
            const AppBackButton(),

            SizedBox(height: Dimension.ylenght * 5),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Hi there! tell us a bit",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    TextWidget(
                      text: "about ",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      text: "yourself",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      textColor: SmartpayColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: Dimension.ylenght * 5),

            // Text fields
            TextField(),

            SizedBox(height: Dimension.ylenght * 3),
            TextField(),

            SizedBox(height: Dimension.ylenght * 3),
            TextField(),

            SizedBox(height: Dimension.ylenght * 3),

            TextField(),

            SizedBox(height: Dimension.ylenght * 3),

            AppButton(
              width: double.infinity,
              onClick: () => navigate(context, const CreatePinScreen()),
              text: "Sign In",
            ),
          ],
        ),
      ),
    );
  }
}
