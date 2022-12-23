import 'package:doctor_system/blocs/cubit/add_patient_cubit.dart';
import 'package:doctor_system/blocs/cubit/get_patient_cubit.dart';
import 'package:doctor_system/blocs/edit_patient/cubit/edit_patient_cubit.dart';
import 'package:doctor_system/components/custom_botton.dart';
import 'package:doctor_system/components/custom_textform.dart';
import 'package:doctor_system/config/toast_config.dart';
import 'package:doctor_system/enums/toast_status.dart';
import 'package:doctor_system/models/app_colors.dart';
import 'package:doctor_system/screens/get_patient_screen.dart';

import 'package:doctor_system/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPatientScreen extends StatelessWidget {
  int? id;
  EditPatientScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AppNavigator.appNavigator(context, GetPatientScreen(),
                  isFinished: true);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.kRedColor,
              size: 25.sp,
            )),
        elevation: 0,
        backgroundColor: AppColors.kWhiteColor,
        title: Text(
          'Edit Patient'.toUpperCase(),
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kBalckColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => EditPatientCubit(),
          child: BlocConsumer<EditPatientCubit, EditPatientState>(
            listener: (context, state) {
              if (state is EditPatientSuccsessState) {
                AppNavigator.appNavigator(context, GetPatientScreen());
                ToastConfig.showToast(
                    msg: "Done", toastStates: ToastStates.Success);
              }

              if (state is EditPatientErrorState) {
                ToastConfig.showToast(
                    msg: 'Error', toastStates: ToastStates.Warning);
              }
            },
            builder: (context, state) {
              var cubit = EditPatientCubit.get(context);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextForm(
                            lable: 'Name', controller: cubit.nameController),
                        CustomTextForm(
                            lable: 'Address',
                            controller: cubit.addressController),
                        CustomTextForm(
                            lable: 'Diagnosis',
                            controller: cubit.diagnosisController),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          color: AppColors.kRedColor,
                          text: 'edit',
                          function: () {
                            cubit.editPatient(id!);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
