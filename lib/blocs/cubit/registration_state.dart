part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}
class RegisterLoadingState extends RegistrationState {}
class RegisterSucssesState extends RegistrationState {}
class RegisterErrorState extends RegistrationState {}
