import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/asset_paths.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/features/auth/password_recovery/view/verify_identity_screen.dart';

class RecoveryEmailScreen extends StatefulWidget {
  const RecoveryEmailScreen({super.key});

  @override
  State<RecoveryEmailScreen> createState() => _RecoveryEmailScreenState();
}

class _RecoveryEmailScreenState extends State<RecoveryEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Spacing
            SizedBox(height: Dimension.ylenght * 8),

            // Lock Icon
            Image.asset(AssetPaths.lockIcon),

            SizedBox(height: Dimension.ylenght * 3),

            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Password Recovery",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: Dimension.ylenght * 1.5),
                TextWidget(
                  text:
                      "Enter your registered email below to receive password instructions",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  textColor: SmartpayColors.greyColor,
                ),
              ],
            ),

            SizedBox(height: Dimension.ylenght * 3),

            // Email
            const TextField(),

            SizedBox(height: Dimension.ylenght * 6),

            // Send me email
            AppButton(
              width: double.infinity,
              text: "Send me email",
              onClick: () => navigate(context, const VerifyIdentityScreen()),
            )
          ],
        ),
      ),
    );
  }
}
