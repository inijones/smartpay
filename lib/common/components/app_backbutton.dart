
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => popView(context),
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
          border: Border.all(
            color: SmartpayColors.greyScaleColor,
            width: 1,
          ),
        ),
        child: const Center(
          child: Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
