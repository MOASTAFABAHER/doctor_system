import 'package:bloc/bloc.dart';
import 'package:doctor_system/models/add_patient.dart';
import 'package:doctor_system/service/dio_helper.dart';
import 'package:doctor_system/service/local/sp__keys.dart';
import 'package:doctor_system/service/local/sp_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  AddPatientCubit() : super(AddPatientInitial());
  static AddPatientCubit get(context) => BlocProvider.of(context);
  AddPatient? addPatient;
  TextEditingController nameController = TextEditingController();

  TextEditingController diagnosisController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  addPatientDate() {
    emit(AddPatientLoadigState());
    DioHelper.postData(url: 'doctorpatients', data: {
      'name': nameController.text,
      'date_of_birth': "2020-3-20",
      'diagnosis': diagnosisController.text,
      'address': addressController.text,
      'visit_time': "2020-3-20-12",
    }, query: {
      'token': SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    }).then((value) {
      emit(AddPatientSucssesState());
      print(value.data);
    }).catchError((error) {
      emit(AddPatientErrorState());
      print(error);
    });
  }
}
