// Page View
import 'package:flutter/material.dart';
import 'package:smartpay/constants/asset_paths.dart';
import 'package:smartpay/features/onboarding/view/component/onboarding_content.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;

  const OnboardingPageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnboardingContent(
          pageController: controller,
          device: AssetPaths.deviceImage1,
          illustration: AssetPaths.illustrationImage1,
          title: "Finance app the safest and most trusted",
          description:
              "Your finance work starts here. Our here to help you track and deal with speeding up your transactions.",
        ),
        OnboardingContent(
          pageController: controller,
          device: AssetPaths.deviceImage2,
          illustration: AssetPaths.illustrationImage2,
          title: "The fastest transaction process only here",
          description:
              "Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.",
        ),
      ],
    );
  }
}