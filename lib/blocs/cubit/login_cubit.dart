import 'package:bloc/bloc.dart';
import 'package:doctor_system/models/authentication.dart';
import 'package:doctor_system/service/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../service/local/sp__keys.dart';
import '../../service/local/sp_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  Authentication? authentication;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: 'auth/login',
      data: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    ).then(
      (value) {
        authentication = Authentication.fromJson(value.data);
        SharedPrefrenceHelper.saveData(
            key: SharedPreferencesKeys.token, value: authentication!.token);
        emit(LoginSucssesState());
        emailController.clear();
        passwordController.clear();
        print(
            'Token ${SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)}');
      },
    ).catchError(
      (e) {
        emit(LoginErrorState());
        emailController.clear();
        passwordController.clear();
      },
    );
  }
}
