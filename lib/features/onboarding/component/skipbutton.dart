import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/constants/colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {},
        child: TextWidget(
          text: "Skip",
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          textColor: SmartpayColors.blueColor,
        ),
      ),
    );
  }
}