import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/asset_paths.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/features/onboarding/view/onboarding_screen.dart';
import 'package:smartpay/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const route = ScreenPaths.splashScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => navigate(context, const OnboardingScreen()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetPaths.smartpayLogo),
            SizedBox(height: Dimension.ylenght * 1.5),
            SvgPicture.asset(AssetPaths.titleLogo),
          ],
        ),
      ),
    );
  }
}
