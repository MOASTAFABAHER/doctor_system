import 'package:doctor_system/blocs/delete_patient/cubit/delete_task_cubit.dart';
import 'package:doctor_system/config/toast_config.dart';
import 'package:doctor_system/enums/toast_status.dart';
import 'package:doctor_system/models/app_colors.dart';
import 'package:doctor_system/screens/edit_patient_screen.dart';
import 'package:doctor_system/utils/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/generat_color/cubit/gnerate_color_cubit.dart';

class Patinetitem extends StatelessWidget {
  String index;
  String? text1;
  String time;
  int? id;

  Patinetitem(
      {required this.index,
      required this.text1,
      required this.time,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) => GnerateColorCubit()..generateColor(),
        child: BlocConsumer<GnerateColorCubit, GnerateColorState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = GnerateColorCubit.get(context);
            return Container(
              padding: EdgeInsets.all(4),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cubit.colorsList[cubit.index!]),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.kBackgroundColor,
                    child: Text(
                      index,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 85.w,
                          child: Text(
                            text1 == null ? 'Null' : text1!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
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
                      IconButton(
                          onPressed: () {
                            AppNavigator.appNavigator(
                                context,
                                EditPatientScreen(
                                  id: id,
                                ),
                                isFinished: true);
                          },
                          icon: Icon(Icons.edit)),
                      BlocProvider(
                        create: (context) => DeleteTaskCubit(),
                        child: BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
                          listener: (context, state) {
                            if (state is DeleteTaskSuccsessState) {
                              ToastConfig.showToast(
                                  msg: "Deleted",
                                  toastStates: ToastStates.Success);
                            }
                          },
                          builder: (context, state) {
                            return IconButton(
                                onPressed: () {
                                  DeleteTaskCubit.get(context).deleteTask(id!);
                                },
                                icon: Icon(Icons.delete));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
