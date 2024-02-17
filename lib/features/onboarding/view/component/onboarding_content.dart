import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/constants/colors.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    this.device,
    this.illustration,
    this.title,
    this.description,
    this.pageController,
  });

  final String? device;
  final String? illustration;
  final String? title;
  final String? description;
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                width: 292.w,
                height: 455.h,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Positioned(
                      top: 10.h,
                      left: 50.w,
                      right: 50.w,
                      child: SizedBox(
                        width: 202.w,
                        height: 407.h,
                        child: Center(
                          child: Image.asset(
                            device ?? "",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      child: SizedBox(
                        height: 240.h,
                        width: 292.w,
                        child: SvgPicture.asset(
                          illustration ?? "",
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
                  height: 200.h,
                  decoration: const BoxDecoration(
                    color: SmartpayColors.scaffoldBackground,
                  ),
                  child: TitleWidget(
                    title: title,
                    description: description,
                    pageController: pageController ?? PageController(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    required this.description,
    required this.pageController,
  });

  final String? title;
  final String? description;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        SizedBox(
          width: 260.w,
          height: 60.h,
          child: TextWidget(
            text: title ?? "",
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 260.w,
          height: 60.h,
          child: TextWidget(
            text: description ?? "",
            fontSize: 14.sp,
            textColor: SmartpayColors.greyColor,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
