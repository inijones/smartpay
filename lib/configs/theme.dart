import 'package:flutter/material.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: update zeeh colors.
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: SmartpayColors.scaffoldBackground,
    primarySwatch: const MaterialColor(
      0xFF000000,
      {
        50: Color.fromRGBO(255, 27, 3, .1),
        100: Color.fromRGBO(0, 0, 0, .2),
        200: Color.fromRGBO(0, 0, 0, .3),
        300: Color.fromRGBO(0, 0, 0, .4),
        400: Color.fromRGBO(0, 0, 0, .5),
        500: Color.fromRGBO(0, 0, 0, .6),
        600: Color.fromRGBO(0, 0, 0, .7),
        700: Color.fromRGBO(0, 0, 0, .8),
        800: Color.fromRGBO(0, 0, 0, .9),
        900: Color.fromRGBO(0, 0, 0, 1),
      },
    ),
    primaryColor: Colors.grey,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    // pageTransitionsTheme: const PageTransitionsTheme(builders: {
    //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //   TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    // }),
    fontFamily: 'DM Sans',
    appBarTheme: const AppBarTheme(
      backgroundColor: SmartpayColors.scaffoldBackground,
      elevation: 0,
      foregroundColor: SmartpayColors.blackColor,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: const BorderSide(
          color: Color(0xFFDAD9D9),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: SmartpayColors.greyColor,
        fontFamily: 'DM Sans',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: SmartpayColors.greyColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
    ),
  );
}
