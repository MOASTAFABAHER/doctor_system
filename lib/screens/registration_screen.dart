import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_system/blocs/cubit/registration_cubit.dart';
import 'package:doctor_system/components/custom_botton.dart';
import 'package:doctor_system/components/custom_textform.dart';
import 'package:doctor_system/config/toast_config.dart';
import 'package:doctor_system/enums/toast_status.dart';
import 'package:doctor_system/models/app_colors.dart';
import 'package:doctor_system/screens/get_patient_screen.dart';
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
        body: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: NetworkImage(
          //             'https://images.pexels.com/photos/4021773/pexels-photo-4021773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          //         fit: BoxFit.fill)),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocProvider(
                  create: (context) => RegistrationCubit(),
                  child: BlocConsumer<RegistrationCubit, RegistrationState>(
                    listener: (context, state) {
                      if (state is RegisterErrorState) {
                        ToastConfig.showToast(
                            msg: 'Error', toastStates: ToastStates.Error);
                      }
                      if (state is RegisterSucssesState) {
                        ToastConfig.showToast(
                            msg: 'Wellcome ', toastStates: ToastStates.Success);
                        AppNavigator.appNavigator(context, GetPatientScreen(),
                            isFinished: true);
                      }
                    },
                    builder: (context, state) {
                      var cubit = RegistrationCubit.get(context);
                      return Column(
                        children: [
                          AnimatedTextKit(repeatForever: true, animatedTexts: [
                            TypewriterAnimatedText('Registration ',
                                textStyle: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.kWhiteColor),
                                curve: Curves.easeIn,
                                speed: Duration(milliseconds: 80)),
                          ]),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextForm(
                              lable: 'Name', controller: cubit.nameController),
                          CustomTextForm(
                            lable: 'Email',
                            controller: cubit.emailController,
                          ),
                          CustomTextForm(
                              isPassword: true,
                              lable: 'password',
                              controller: cubit.passwordController),
                          CustomTextForm(
                              lable: 'Title',
                              controller: cubit.titleController),
                          CustomTextForm(
                              lable: 'Address',
                              controller: cubit.addresController),
                          Row(
                            children: [
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.kWhiteColor),
                              ),
                              TextButton(
                                  onPressed: () {
                                    AppNavigator.appNavigator(
                                        context, LoginScreen(),
                                        isFinished: true);
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 16.sp),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomButton(
                              function: () {
                                cubit.register();
                              },
                              color: AppColors.kOrangeColor,
                              text: 'Register')
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
