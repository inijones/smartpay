
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/constants/colors.dart';

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
