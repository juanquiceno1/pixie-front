part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthCheckingState extends AuthState {}

// class AuthAuthenticatedState extends AuthState {
//   final UserDataModel userData;
//   const AuthAuthenticatedState(this.userData);
// }

class AuthNoAuthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String title;
  final String message;

  const AuthErrorState({
    required this.title,
    required this.message,
  });
}

class SuccessSendCodeState extends AuthState {}

class ResetPasswordSuccesState extends AuthState {}

class FinishWithError extends AuthState {
  final String error;

  const FinishWithError({required this.error});

  @override
  String toString() => '$runtimeType { error }';
}
