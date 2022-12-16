import 'package:doctor_system/blocs/cubit/login_cubit.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        title: Text("Login Screen".toUpperCase()),
        centerTitle: true,
        backgroundColor: AppColors.kRedColor,
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSucssesState) {
              AppNavigator.appNavigator(context, HomeScreen(),
                  isFinished: true);
              ToastConfig.showToast(
                  msg: 'Wellcome Back !', toastStates: ToastStates.Success);
            }
          },
          builder: (context, state) {
              var cubit = LoginCubit.get(context);
            return Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        CustomTextForm(
                            lable: 'Email', controller: cubit.emailController),
                        CustomTextForm(
                          lable: 'password',
                          controller: cubit.passwordController,
                          isPassword: true,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
