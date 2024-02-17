import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/configs/theme.dart';
import 'package:smartpay/routes.dart';
import 'package:smartpay/services/navigator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // await Hive.initFlutter().then((value) => ,)

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(const ProviderScope(child: MyApp()));
}

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Smartpay',
          theme: theme(),
          navigatorObservers: [routeObserver],
          navigatorKey: navigatorKey,
          initialRoute: '/',
          routes: routes(),
          onGenerateRoute: generateRoutes,
          scrollBehavior: const CupertinoScrollBehavior(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
