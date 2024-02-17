
import 'package:flutter/material.dart';
import 'package:smartpay/features/onboarding/view/splash_screen.dart';
import 'package:smartpay/routes.dart';

class RootPage extends StatefulWidget {
  static const route = ScreenPaths.rootScreen;
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {




  @override
  Widget build(BuildContext context) {
    return const AnimatedSwitcher(
        duration: Duration(milliseconds: 500), child: SplashScreen()
        // pagetogo == 2 ? const HomeScreen() : const OnboardingScreen1(),
        );
  }

 
}
