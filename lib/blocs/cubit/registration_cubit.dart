import 'package:bloc/bloc.dart';
import 'package:doctor_system/models/authentication.dart';
import 'package:doctor_system/service/dio_helper.dart';
import 'package:doctor_system/service/local/sp__keys.dart';
import 'package:doctor_system/service/local/sp_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  Authentication? registration;
  static RegistrationCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController addresController = TextEditingController();
  register() {
    emit(RegisterLoadingState());
    DioHelper.postData(url: 'auth/register', data: {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "title": titleController.text,
      "address": addresController.text
    }).then((value) {
      emit(RegisterSucssesState());
      registration = Authentication.fromJson(value.data);
      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.token, value: registration!.token);
      print(SharedPreferencesKeys.token);
    }).catchError((error) {
      print('error: $error');
      emit(RegisterErrorState());
    });
  }
}
