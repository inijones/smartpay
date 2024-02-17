import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/common/components/app_backbutton.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/asset_paths.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/features/auth/view/sign_in/component/or_widget.dart';
import 'package:smartpay/features/auth/view/sign_in/sign_in_screen.dart';
import 'package:smartpay/features/auth/view/sign_up/otp_auth_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                Row(
                  children: [
                    TextWidget(
                      text: "Create a ",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      text: "Smartpay",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      textColor: SmartpayColors.primaryColor,
                    ),
                  ],
                ),
                TextWidget(
                  text: "account",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),

            SizedBox(height: Dimension.ylenght * 3),

            TextField(),

            SizedBox(height: Dimension.ylenght * 4),

            AppButton(
              width: double.infinity,
              onClick: () => navigate(context, const  OtpAuthScreen()),
              text: "Sign Up",
            ),

            SizedBox(height: Dimension.ylenght * 3),

            const ORWidget(),

            SizedBox(height: Dimension.ylenght * 3),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppOutlinedButton(
                  height: 55.h,
                  width: 156.w,
                  onPressed: () {},
                  child: SvgPicture.asset(AssetPaths.appleIcon),
                ),
                AppOutlinedButton(
                  height: 55.h,
                  width: 156.w,
                  onPressed: () {},
                  child: SvgPicture.asset(AssetPaths.googleIcon),
                ),
              ],
            ),

            SizedBox(height: Dimension.ylenght * 7),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "Already have an account?",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: () => navigate(context, const SignInScreen()),
                  child: TextWidget(
                    text: "Sign In",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: SmartpayColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
