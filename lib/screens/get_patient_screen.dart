import 'package:doctor_system/blocs/cubit/get_patient_cubit.dart';
import 'package:doctor_system/components/patient_item.dart';
import 'package:doctor_system/models/app_colors.dart';
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
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kRedColor,
        title: Text("patint's List ".toUpperCase()),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => GetPatientCubit()..getAllPatient(),
        child: BlocConsumer<GetPatientCubit, GetPatientState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GetPatientCubit.get(context);
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Patinetitem(
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
    );
  }
}
