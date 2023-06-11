part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final List<UserModel> model;
  UserSuccessState({required this.model});
}

class UserErrorState extends UserState {
  final String errorText;
  UserErrorState({required this.errorText});
}
