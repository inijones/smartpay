import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/asset_paths.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/features/auth/sign_in/view/sign_in_screen.dart';
import 'package:smartpay/features/onboarding/component/skipbutton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: Dimension.ylenght * 6),

            // Skip Button
            const SkipButton(),

            // Ilustration
            SizedBox(
              height: 650.h,
              child: Stack(
                children: [
                  SizedBox(
                    width: 292.w,
                    height: 407.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10.h,
                          left: 57.w,
                          right: 57.w,
                          child: SizedBox(
                            width: 202.w,
                            height: 407.h,
                            child: Image.asset(
                              AssetPaths.deviceImage1,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50.h,
                          child: SizedBox(
                            height: 240.h,
                            width: 292.w,
                            child: SvgPicture.asset(
                              AssetPaths.illustrationImage1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 375.w,
                      height: 390.h,
                      decoration: const BoxDecoration(
                        color: SmartpayColors.scaffoldBackground,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 50.h),
                          SizedBox(
                            width: 260.w,
                            height: 62.h,
                            child: TextWidget(
                              text: "Finance app the safest and most trusted",
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            width: 260.w,
                            height: 62.h,
                            child: TextWidget(
                              text:
                                  "Your finance work starts here. Our here to help you track and deal with speeding up your transactions.",
                              fontSize: 14.sp,
                              textColor: SmartpayColors.greyColor,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                          SizedBox(height: 50.h),
                          AppButton(
                            onClick: () => navigate(
                              context,
                              const SignInScreen(),
                            ),
                            text: "Get Started",
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Image.asset(AssetPaths.deviceImage2),
          ],
        ),
      ),
    );
  }
}
