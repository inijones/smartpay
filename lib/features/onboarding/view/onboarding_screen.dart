import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/features/auth/view/sign_in/sign_in_screen.dart';
import 'package:smartpay/features/onboarding/view/component/onboarding_pageview.dart';
import 'package:smartpay/features/onboarding/view/component/skipbutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(initialPage: 0);

  int _currentPage = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

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

            SizedBox(height: Dimension.ylenght * 5),

            // Ilustration
            SizedBox(
              height: 500.h,
              child: OnboardingPageView(
                controller: controller,
              ),
            ),

            IndicatorWidget(controller: controller),

            SizedBox(height: Dimension.ylenght * 5),

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
      // Image.asset(AssetPaths.deviceImage2),
    );
  }
}

// Indicator Widget
class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 2,
      effect: ExpandingDotsEffect(
        activeDotColor: SmartpayColors.blackColor,
        dotColor: SmartpayColors.greyColor,
        dotHeight: 8.h,
        dotWidth: 8.h,
      ),
    );
  }
}
