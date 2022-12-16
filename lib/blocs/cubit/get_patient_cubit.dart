import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/patients_request.dart';
import '../../service/dio_helper.dart';
import '../../service/local/sp__keys.dart';
import '../../service/local/sp_helper.dart';

part 'get_patient_state.dart';

class GetPatientCubit extends Cubit<GetPatientState> {
  GetPatientCubit() : super(GetPatientInitial());
  static GetPatientCubit get(context) => BlocProvider.of(context);
  PatientRequet? getPatients;
  getAllPatient() {
    emit(GetPatientLoadingState());
    DioHelper.getData(url: 'doctorpatients', query: {
      "token": SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    }).then((value) {
      getPatients = PatientRequet.fromJson(value.data);
      emit(GetPatientSucssesState());
    
    }).catchError((error) {
      emit(GetPatientErrorState());
      print(error);
    });
  }
}
