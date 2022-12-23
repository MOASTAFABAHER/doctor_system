import 'package:doctor_system/models/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForm extends StatelessWidget {
  final String lable;
  final bool isPassword;
  final TextEditingController controller;

  CustomTextForm(
      {required this.lable, this.isPassword = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
      child: TextFormField(
        style: TextStyle(
            color: AppColors.kBalckColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            label: Text(
              '$lable',
            )),
      ),
    );
  }
}
