part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSucssesState extends LoginState {}

class LoginErrorState extends LoginState {}
