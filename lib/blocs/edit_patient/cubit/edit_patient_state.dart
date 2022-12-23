part of 'edit_patient_cubit.dart';

@immutable
abstract class EditPatientState {}

class EditPatientInitial extends EditPatientState {}

class EditPatientErrorState extends EditPatientState {}

class EditPatientSuccsessState extends EditPatientState {}

class EditPatientLoadingState extends EditPatientState {}
