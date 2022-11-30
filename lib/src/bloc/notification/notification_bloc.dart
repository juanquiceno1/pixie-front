import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/notification_services.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  FToast fToast = FToast();
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationInitialEvent>((event, emit) => emit(NotificationInitial()));
    // on<NetworkConnectivityEvent>(_notificationNetworkStatus);
    on<NotificationMessageEvent>(_notificationMessage);
  }

  void _notificationMessage(
      NotificationMessageEvent event, Emitter<NotificationState> emit) {
    emit(NotificationInitial());
    emit(
      NotificationMessageState(
        message: event.message,
        icon: event.icon,
        type: event.type,
        duration: event.duration,
      ),
    );
  }
}
