import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_system/blocs/cubit/login_cubit.dart';
import 'package:doctor_system/components/custom_botton.dart';
import 'package:doctor_system/components/custom_textform.dart';
import 'package:doctor_system/config/toast_config.dart';
import 'package:doctor_system/enums/toast_status.dart';
import 'package:doctor_system/models/app_colors.dart';
import 'package:doctor_system/screens/get_patient_screen.dart';
import 'package:doctor_system/screens/registration_screen.dart';

import 'package:doctor_system/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/4386464/pexels-photo-4386464.jpeg?auto=compress&cs=tinysrgb&w=600',
                ),
                fit: BoxFit.fill)),
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSucssesState) {
                AppNavigator.appNavigator(context, GetPatientScreen(),
                    isFinished: true);
                ToastConfig.showToast(
                    msg: 'Wellcome Back !', toastStates: ToastStates.Success);
              }
              if (state is LoginErrorState) {
                ToastConfig.showToast(
                    msg: "Error", toastStates: ToastStates.Error);
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200.h,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText("Welcome to Doctor System ",
                            textStyle: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.bold),
                            speed: Duration(milliseconds: 200)),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                    ),
                    SizedBox(
                      height: 400.h,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/52527/dentist-pain-borowac-cure-52527.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            fit: BoxFit.fill),
                        color: AppColors.kWhiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText('Login',
                                        textStyle: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.kWhiteColor))
                                  ],
                                  totalRepeatCount: 16,
                                )),
                            CustomTextForm(
                                lable: 'Email',
                                controller: cubit.emailController),
                            CustomTextForm(
                              lable: 'password',
                              controller: cubit.passwordController,
                              isPassword: true,
                            ),
                            Row(
                              children: [
                                const Text('Don\'t have an account'),
                                TextButton(
                                  onPressed: () {
                                    AppNavigator.appNavigator(
                                        context, const RegistrationScreen(),
                                        isFinished: true);
                                  },
                                  child: const Text('Regist'),
                                ),
                              ],
                            ),
                            CustomButton(
                              color: AppColors.kRedColor,
                              text: 'Login',
                              function: () {
                                cubit.login();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
