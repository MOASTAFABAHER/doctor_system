import 'package:doctor_system/components/custom_botton.dart';
import 'package:doctor_system/models/app_colors.dart';
import 'package:doctor_system/screens/add_patient_screen.dart';
import 'package:doctor_system/screens/get_patient_screen.dart';
import 'package:doctor_system/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        title: Text('Home Screen'.toUpperCase()),
        backgroundColor: AppColors.kRedColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  color: AppColors.kRedColor,
                  text: 'Add paitent',
                  function: () {
                    AppNavigator.appNavigator(context, AddPatientScreen());
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomButton(
                  color: AppColors.kOrangeColor,
                  text: 'get All Paients',
                  function: () {
                    AppNavigator.appNavigator(context, GetPatientScreen());
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(color: AppColors.kRedColor, text: 'View paitents'),
                SizedBox(
                  width: 10.w,
                ),
                CustomButton(color: AppColors.kRedColor, text: 'View paitents'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
