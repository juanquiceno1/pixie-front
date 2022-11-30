part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationMessageState extends NotificationState {
  final String message;
  final IconData? icon;
  final TypeNotification? type;
  final int? duration;
  const NotificationMessageState(
      {required this.message, this.type, this.icon, this.duration});
}
