import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/constants/asset_paths.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetPaths.thumbsUpIcon),

            SizedBox(height: Dimension.xlenght * 4),

            // Congratulations, James
            TextWidget(
              text: "Congratulations, James",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),

            SizedBox(height: Dimension.xlenght * 3),

            TextWidget(
              text: "You’ve completed the onboarding, you can start using",
              fontSize: 16.sp,
              textColor: SmartpayColors.greyColor,
              fontWeight: FontWeight.w700,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: Dimension.xlenght * 6),

            // App Button
            AppButton(
              onClick: () {},
              text: "Get Started",
            ),
          ],
        ),
      ),
    );
  }
}
