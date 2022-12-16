import 'package:doctor_system/blocs/cubit/add_patient_cubit.dart';
import 'package:doctor_system/components/custom_botton.dart';
import 'package:doctor_system/components/custom_textform.dart';
import 'package:doctor_system/config/toast_config.dart';
import 'package:doctor_system/enums/toast_status.dart';
import 'package:doctor_system/models/app_colors.dart';
import 'package:doctor_system/screens/home_screen.dart';
import 'package:doctor_system/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPatientScreen extends StatelessWidget {
  const AddPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kRedColor,
        title: Text('Add patient'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => AddPatientCubit(),
          child: BlocConsumer<AddPatientCubit, AddPatientState>(
            listener: (context, state) {
              if (state is AddPatientSucssesState) {
                AppNavigator.appNavigator(context, HomeScreen());
                ToastConfig.showToast(
                    msg: "Added", toastStates: ToastStates.Success);
              }
              if (state is AddPatientErrorState) {
                ToastConfig.showToast(
                    msg: 'Error', toastStates: ToastStates.Error);
              }
              if (state is AddPatientLoadigState) {
                CircularProgressIndicator();
              }
            },
            builder: (context, state) {
              var cubit = AddPatientCubit.get(context);
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
                          text: 'Add',
                          function: () {
                            cubit.addPatientDate();
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
