part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthChangeRoute extends AuthEvent {
  final String? route;
  const AuthChangeRoute(this.route);
}

class AuthLogoutEvent extends AuthEvent {
  final BuildContext context;
  const AuthLogoutEvent(this.context);
}

class AuthValidateEvent extends AuthEvent {
  final BuildContext context;
  const AuthValidateEvent(this.context);
}

class AuthLoginEvent extends AuthEvent {
  final BuildContext context;
  final LoginModel model;
  const AuthLoginEvent({required this.context, required this.model});
}

// class SendCodeEvent extends AuthEvent {
//   final BuildContext context;
//   final ResetPassModel model;
//   const SendCodeEvent({required this.context, required this.model});
// }

// class ResetPasswordEvent extends AuthEvent {
//   final BuildContext context;
//   final ResetPassModel model;
//   const ResetPasswordEvent({
//     required this.context,
//     required this.model,
//   });
// }
