part of 'add_patient_cubit.dart';

@immutable
abstract class AddPatientState {}

class AddPatientInitial extends AddPatientState {}

class AddPatientLoadigState extends AddPatientState {}

class AddPatientSucssesState extends AddPatientState {}

class AddPatientErrorState extends AddPatientState {}
