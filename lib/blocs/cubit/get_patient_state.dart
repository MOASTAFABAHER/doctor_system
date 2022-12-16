part of 'get_patient_cubit.dart';

@immutable
abstract class GetPatientState {}

class GetPatientInitial extends GetPatientState {}
class GetPatientSucssesState extends GetPatientState {}
class GetPatientLoadingState extends GetPatientState {}
class GetPatientErrorState extends GetPatientState {}
