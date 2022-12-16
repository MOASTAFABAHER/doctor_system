import 'package:doctor_system/screens/home_screen.dart';
import 'package:doctor_system/screens/login_screen.dart';
import 'package:doctor_system/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  ScreenUtilInit build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          home: RegistrationScreen(),
        );
      },
    );
  }
}
