import 'package:doctor_system/blocs/cubit/get_patient_cubit.dart';
import 'package:doctor_system/components/patient_item.dart';
import 'package:doctor_system/models/app_colors.dart';
import 'package:doctor_system/screens/add_patient_screen.dart';
import 'package:doctor_system/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetPatientScreen extends StatelessWidget {
  const GetPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        leading: Icon(Icons.abc),
        elevation: 0,
        backgroundColor: AppColors.kWhiteColor,
        title: Text(
          "patint's List ".toUpperCase(),
          style: TextStyle(
              color: AppColors.kBalckColor,
              fontSize: 23.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => GetPatientCubit()..getAllPatient(),
        child: BlocConsumer<GetPatientCubit, GetPatientState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GetPatientCubit.get(context);
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return state is GetPatientLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kRedColor,
                          ),
                        )
                      : Patinetitem(
                          id: cubit.getPatients?.data!.data?[index].id,
                          index: (index + 1).toString(),
                          text1: cubit.getPatients?.data!.data?[index].name,
                          time: '20-20-20020');
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5.h,
                  );
                },
                itemCount: cubit.getPatients?.data!.data!.length == null
                    ? 1
                    : cubit.getPatients!.data!.data!.length);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.appNavigator(context, AddPatientScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
