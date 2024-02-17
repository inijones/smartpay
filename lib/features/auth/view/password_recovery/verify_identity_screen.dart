import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/asset_paths.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/features/auth/view/password_recovery/create_new_password_screen.dart';

class VerifyIdentityScreen extends StatefulWidget {
  const VerifyIdentityScreen({super.key});

  @override
  State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
}

class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> {
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
            Image.asset(AssetPaths.personIcon),

            SizedBox(height: Dimension.ylenght * 3),

            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Verify your identity",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: Dimension.ylenght * 1.5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: "Where would you like ",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          textColor: SmartpayColors.greyColor,
                        ),
                        TextWidget(
                          text: "Smartpay ",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          textColor: SmartpayColors.primaryColor,
                        ),
                        TextWidget(
                          text: "to send your",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          textColor: SmartpayColors.greyColor,
                        ),
                      ],
                    ),
                    TextWidget(
                      text: "security code?",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      textColor: SmartpayColors.greyColor,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: Dimension.ylenght * 3),

            // Email
            Row(
              children: [
                SvgPicture.asset(AssetPaths.checkIcon),
                SizedBox(width: Dimension.xlenght * 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Email",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      text: "A*******@mail.com",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(AssetPaths.messageIcon),
              ],
            ),

            SizedBox(height: Dimension.ylenght * 35),

            // Send me email
            AppButton(
              width: double.infinity,
              text: "Continue",
              onClick: () => navigate(
                context,
                const CreateNewPasswordScreen(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
