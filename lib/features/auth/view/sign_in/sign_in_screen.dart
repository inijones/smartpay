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
import 'package:smartpay/features/auth/view/password_recovery/recovery_email_screen.dart';
import 'package:smartpay/features/auth/view/sign_up/sign_up_email_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

            SizedBox(height: Dimension.ylenght * 5),

            // Hi There & Welcome
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Hi There! 👋",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 10.h),

                // Welcome
                TextWidget(
                  text: "Welcome back, Sign in to your account",
                  fontSize: 16.sp,
                  textColor: SmartpayColors.greyColor,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),

            // Email & Password
            SizedBox(height: Dimension.ylenght * 5),

            TextField(),

            SizedBox(height: Dimension.ylenght * 3),

            TextField(),

            SizedBox(height: Dimension.ylenght * 3),

            // Forgot Password
            InkWell(
              onTap: () => navigate(context, const RecoveryEmailScreen()),
              child: TextWidget(
                text: "Forgot Password?",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                textColor: SmartpayColors.primaryColor,
              ),
            ),

            SizedBox(height: Dimension.ylenght * 4),

            AppButton(
              width: double.infinity,
              onClick: () {},
              text: "Sign In",
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

            SizedBox(height: Dimension.ylenght * 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "Don't have an account?",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: () => navigate(context, const SignUpScreen()),
                  child: TextWidget(
                    text: "Sign Up",
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

class ORWidget extends StatelessWidget {
  const ORWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 140.w,
          child: const Divider(
            thickness: 1,
            color: Color(0xffE5E7EB),
          ),
        ),
        SizedBox(width: 10.h),
        const TextWidget(
          text: 'OR',
          textColor: SmartpayColors.greyColor,
        ),
        SizedBox(width: 10.h),
        SizedBox(
          width: 140.w,
          child: const Divider(
            thickness: 1,
            color: Color(0xffE5E7EB),
          ),
        ),
      ],
    );
  }
}
