import 'package:doctor_system/blocs/cubit/registration_cubit.dart';
import 'package:doctor_system/components/custom_botton.dart';
import 'package:doctor_system/components/custom_textform.dart';
import 'package:doctor_system/config/toast_config.dart';
import 'package:doctor_system/enums/toast_status.dart';
import 'package:doctor_system/models/app_colors.dart';
import 'package:doctor_system/screens/home_screen.dart';
import 'package:doctor_system/screens/login_screen.dart';
import 'package:doctor_system/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        title: Text('registration'.toUpperCase()),
        centerTitle: true,
        backgroundColor: AppColors.kRedColor,
      ),
      body: BlocProvider(
        create: (context) => RegistrationCubit(),
        child: BlocConsumer<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state is RegisterSucssesState) {
              AppNavigator.appNavigator(context, HomeScreen(),
                  isFinished: true);
              ToastConfig.showToast(
                  msg: 'Wellcome to our team',
                  toastStates: ToastStates.Success);
            }
            ;
            if (state is RegisterErrorState) {
              print('Error');
            }
            ;
            if (state is RegisterLoadingState) {
              CircularProgressIndicator();
            }
          },
          builder: (context, state) {
            var cubit = RegistrationCubit.get(context);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 0),
                child: Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.kWhiteColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextForm(
                            lable: 'Email', controller: cubit.emailController),
                        CustomTextForm(
                            lable: 'password',
                            controller: cubit.passwordController),
                        CustomTextForm(
                            lable: 'Name', controller: cubit.nameController),
                        CustomTextForm(
                            lable: 'Addres',
                            controller: cubit.addresController),
                        CustomTextForm(
                            lable: 'titlle', controller: cubit.titleController),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                'Have an account ?',
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.black),
                              ),
                              TextButton(
                                  onPressed: () {
                                    AppNavigator.appNavigator(
                                      context,
                                      LoginScreen(),
                                    );
                                  },
                                  child: Text('Login'))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          color: AppColors.kRedColor,
                          text: 'Register'.toUpperCase(),
                          function: () {
                            cubit.register();
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
