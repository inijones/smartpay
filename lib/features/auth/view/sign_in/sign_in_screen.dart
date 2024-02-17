import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/common/components/app_backbutton.dart';
import 'package:smartpay/common/components/app_snackbar.dart';
import 'package:smartpay/common/components/button.dart';
import 'package:smartpay/common/components/text_field_box.dart';
import 'package:smartpay/common/components/text_widget.dart';
import 'package:smartpay/common/utils/navigator.dart';
import 'package:smartpay/constants/asset_paths.dart';
import 'package:smartpay/constants/colors.dart';
import 'package:smartpay/constants/dimensions.dart';
import 'package:smartpay/features/auth/data/state/auth_notifier.dart';
import 'package:smartpay/features/auth/view/password_recovery/recovery_email_screen.dart';
import 'package:smartpay/features/auth/view/sign_in/component/or_widget.dart';
import 'package:smartpay/features/auth/view/sign_up/confirmation_screen.dart';
import 'package:smartpay/features/auth/view/sign_up/sign_up_email_screen.dart';
import 'package:smartpay/features/provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool isObscure = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  bool biometrics = false;

  String? validator(String? value, String field) {
    if (value!.trim().isEmpty) {
      return "$field cannot be empty";
    } else if (field == "Email" &&
        value.contains(RegExp(
            r"^(?:[A-Z\d][A-Z\d_-]{7,20}|[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{5,15})$"))) {
      return "$field isn't valid";
    } else {
      return null;
    }
  }

  handleLogin(WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      ref.read(authStateNotifierProvider.notifier).login(
            emailController.text,
            passwordController.text,
          );
    }
  }

  @override
  void initState() {
    for (var node in focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    for (var element in focusNodes) {
      element.dispose();
    }
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authStae = ref.watch(authStateNotifierProvider);

    ref.listen(
      authStateNotifierProvider,
      (previous, next) {
        if (next is LogInSuccessState) {
          navigate(context, const ConfirmationScreen());
        } else if (next is LogInFailureState) {
          AppSnackbar(context).showToast(text: next.failure.message);
        }
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Spacing
                SizedBox(height: Dimension.ylenght * 6),

                // Back Button
                const AppBackButton(),

                SizedBox(height: Dimension.ylenght * 3),

                // Hi There & Welcome
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Hi There! 👋",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),

                    SizedBox(height: 10.h),

                    // Welcome
                    TextWidget(
                      text: "Welcome back, Sign in to your account",
                      fontSize: 16.sp,
                      textColor: SmartpayColors.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),

                // Email & Password
                SizedBox(height: Dimension.ylenght * 5),

                TextFieldBox(
                  focusNode: focusNodes[0],
                  hintText: "Email",
                  controller: emailController,
                  validator: (String? value) => validator(value, "Email"),
                  onEditingComplete: () {
                    focusNodes[1].requestFocus();
                  },
                ),

                SizedBox(height: Dimension.ylenght * 3),

                TextFieldBox(
                  focusNode: focusNodes[1],
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: isObscure,
                  validator: (String? value) => validator(value, "Password"),
                  onEditingComplete: () {
                    focusNodes[1].unfocus();
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: isObscure
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Center(
                              child: SvgPicture.asset(
                                AssetPaths.hidePasswordIcon,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Center(
                              child: SvgPicture.asset(
                                AssetPaths.showPasswordIcon,
                              ),
                            ),
                          ),
                  ),
                ),

                SizedBox(height: Dimension.ylenght * 3),

                // Forgot Password
                InkWell(
                  onTap: () => navigate(context, const RecoveryEmailScreen()),
                  child: TextWidget(
                    text: "Forgot Password?",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: SmartpayColors.primaryColor,
                  ),
                ),

                SizedBox(height: Dimension.ylenght * 4),

                // Loading or Sign In Button
                if (authStae is LogInLoadingState)
                AppLoadingButton()
                else
                AppButton(
                  width: double.infinity,
                  onClick: () => handleLogin(ref),
                  text: "Sign In",
                ),

                SizedBox(height: Dimension.ylenght * 3),

                const ORWidget(),

                SizedBox(height: Dimension.ylenght * 3),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppOutlinedButton(
                      height: 55.h,
                      width: 156.w,
                      onPressed: () {},
                      child: SvgPicture.asset(AssetPaths.appleIcon),
                    ),
                    AppOutlinedButton(
                      height: 55.h,
                      width: 156.w,
                      onPressed: () {},
                      child: SvgPicture.asset(AssetPaths.googleIcon),
                    ),
                  ],
                ),

                SizedBox(height: Dimension.ylenght * 4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Don't have an account?",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: 2.w),
                    InkWell(
                      onTap: () => navigate(context, const SignUpScreen()),
                      child: TextWidget(
                        text: "Sign Up",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        textColor: SmartpayColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
