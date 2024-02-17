import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartpay/constants/colors.dart';

class PinOTPFieldWidget extends StatefulWidget {
  const PinOTPFieldWidget({
    super.key,
    this.width,
    required this.controller,
    required this.length,
    this.onComplete,
    this.textColor,
    this.inactiveColor,
    this.activeColor,
    this.fieldWidth,
    this.fieldHeight,
    this.borderRadius,
    this.inactiveFillColor,
    this.activeFillColor,
    this.selectedFillColor,
    this.obscureText,
    this.cursorColor,
    this.selecedColor,
  });

  final double? width;
  final TextEditingController controller;
  final int length;
  final Function(String)? onComplete;
  final Color? textColor;
  final Color? inactiveColor;
  final Color? activeColor;

  final double? fieldWidth;
  final double? fieldHeight;

  final double? borderRadius;

  final Color? inactiveFillColor;
  final Color? activeFillColor;
  final Color? selectedFillColor;

  final bool? obscureText;

  final Color? cursorColor;
  final Color? selecedColor;

  @override
  State<PinOTPFieldWidget> createState() => _PinOTPFieldWidgetState();
}

class _PinOTPFieldWidgetState extends State<PinOTPFieldWidget> {
  String currentText = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 300.w,
      child: PinCodeTextField(
        length: widget.length,
        obscureText: widget.obscureText ?? false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        cursorColor: widget.cursorColor ?? Colors.white,
        textStyle: TextStyle(
          color: widget.textColor ?? Colors.white,
          fontFamily: 'SFProDisplay',
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderWidth: 2.h,
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius ?? 16.r),
          ),
          fieldHeight: widget.fieldHeight ?? 56.h,
          fieldWidth: widget.fieldWidth ?? 46.w,
          selectedFillColor: widget.selectedFillColor ??
              const Color(0xffffffff).withOpacity(0.1),
          selectedColor: widget.selecedColor ?? SmartpayColors.primaryColor,
          activeColor: widget.activeColor ?? Colors.transparent,
          activeFillColor: widget.activeFillColor ??
              const Color(0xffffffff).withOpacity(0.1),
          inactiveColor: widget.inactiveColor ?? Colors.transparent,
          inactiveFillColor: widget.inactiveFillColor ??
              const Color(0xffffffff).withOpacity(0.1),
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: widget.controller,
        onCompleted: widget.onComplete,
        onChanged: (value) {
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }
}
