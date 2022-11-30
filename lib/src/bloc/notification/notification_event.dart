part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationInitialEvent extends NotificationEvent {}

class NotificationMessageEvent extends NotificationEvent {
  final String message;
  final IconData? icon;
  final TypeNotification? type;
  final int? duration;
  const NotificationMessageEvent(
      {required this.message, this.type, this.icon, this.duration});
}
