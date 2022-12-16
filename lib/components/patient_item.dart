import 'package:doctor_system/models/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Patinetitem extends StatelessWidget {
  String index;
  String? text1;
  String time;

  Patinetitem({required this.index, required this.text1, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(4),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.kWhiteColor),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.kBackgroundColor,
              child: Text(
                index,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    text1 == null ? 'Null' : text1!,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 100.w,
            ),
            Column(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
