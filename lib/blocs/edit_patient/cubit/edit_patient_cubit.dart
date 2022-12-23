import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/add_patient.dart';
import '../../../service/dio_helper.dart';
import '../../../service/local/sp__keys.dart';
import '../../../service/local/sp_helper.dart';

part 'edit_patient_state.dart';

class EditPatientCubit extends Cubit<EditPatientState> {
  EditPatientCubit() : super(EditPatientInitial());
  static EditPatientCubit get(context) => BlocProvider.of(context);

  AddPatient? addPatient;
  TextEditingController nameController = TextEditingController();

  TextEditingController diagnosisController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  editPatient(int id) {
    emit(EditPatientLoadingState());
    DioHelper.postData(url: 'patients/$id', data: {
      'name': nameController.text,
      'date_of_birth': "2020-3-20",
      'diagnosis': diagnosisController.text,
      'address': addressController.text,
      'visit_time': "2020-3-20-12",
    }, query: {
      'token': SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
      '_method': 'put'
    }).then((value) {
      print('done');
      emit(EditPatientSuccsessState());
      print(value.data);
    }).catchError((error) {
      emit(EditPatientErrorState());
      print(error);
    });
  }
}
