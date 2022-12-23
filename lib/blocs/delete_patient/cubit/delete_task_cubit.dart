import 'package:bloc/bloc.dart';
import 'package:doctor_system/service/dio_helper.dart';
import 'package:doctor_system/service/local/sp__keys.dart';
import 'package:doctor_system/service/local/sp_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());
  static DeleteTaskCubit get(context) => BlocProvider.of(context);
  deleteTask(int id) {
    emit(DeleteTaskLoadingState());
    DioHelper.deleteData(
            url: 'patients/$id',
            token:
                SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value) {
      print('Deleted');
      emit(DeleteTaskSuccsessState());
    }).catchError((error) {
      print('Error$error');
      emit(DeleteTaskErrorState());
    });
  }
}
