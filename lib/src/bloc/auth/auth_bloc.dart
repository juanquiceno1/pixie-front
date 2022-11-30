import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../global_locator.dart';
import '../../models/auth/login_model.dart';
import '../../repository/auth/auth_repository.dart';

import '../../services/local_storage.dart';
import '../../services/notification_services.dart';
import '../../utils/utils.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? currentRoute;
  final _logger = global<Logger>();
  final _api = global<AuthRepository>();
  // UserDataModel userData = UserDataModel.fromJson({});
  AuthStatus authStatus = AuthStatus.checking;

  AuthBloc() : super(AuthInitial()) {
    on<AuthInitialEvent>((event, emit) => emit(AuthInitialState()));
    on<AuthChangeRoute>(_changeRoute);
    on<AuthValidateEvent>(_validateState);
    on<AuthLogoutEvent>(_logoutState);
    on<AuthLoginEvent>(_loginState);
    // on<SendCodeEvent>(_sendCodeState);
    // on<ResetPasswordEvent>(_resetPasswordState);
  }

  void _changeRoute(AuthChangeRoute event, Emitter<AuthState> emit) {
    _logger.wtf('Change route to: ${event.route}');
    currentRoute = event.route;
    emit(AuthInitialState());
  }

  void _validateState(AuthValidateEvent event, Emitter<AuthState> emit) async {
    emit(AuthCheckingState());
    if (!await LocalStorage().onboarding) {
      // NavigationService.removeUntil(Flurorouter.onboardingRoute);
      emit(AuthInitialState());
    } else if (LocalStorage().token != null && LocalStorage().token != '') {
      try {
        await Future.delayed(Duration(seconds: 1));
        await _api.userData().then((value) {
          if (value['statusCode'] == 401) {
            authStatus = AuthStatus.notAuthenticated;
            // NavigationService.removeUntil(Flurorouter.loginRoute);
            emit(AuthNoAuthenticatedState());
          } else {
            try {
              // userData = UserDataModel.fromJson(value);
              authStatus = AuthStatus.authenticated;
              // emit(AuthAuthenticatedState(userData));
            } catch (e) {
              authStatus = AuthStatus.notAuthenticated;
              _navigateOut();
              emit(AuthInitialState());
            }
          }
        }).catchError((e) {
          // NavigationService.removeUntil(Flurorouter.errorLoadRoute);
          emit(FinishWithError(error: e.toString()));
        });
      } catch (e) {
        // NavigationService.removeUntil(Flurorouter.errorLoadRoute);
        emit(FinishWithError(error: e.toString()));
      }
    } else {
      authStatus = AuthStatus.notAuthenticated;
      _navigateOut();
      emit(AuthInitialState());
    }
  }

  void _navigateOut() {
    // if (currentRoute == Flurorouter.registerRoute) {
    //   NavigationService.removeUntil(Flurorouter.registerRoute);
    // } else if (currentRoute == Flurorouter.recoverPasswordRoute) {
    //   NavigationService.removeUntil(Flurorouter.recoverPasswordRoute);
    // } else {
    //   NavigationService.removeUntil(Flurorouter.incomeOptionRoute);
    // }
  }

  void _loginState(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await _api.login(model: event.model).then((value) {
      try {
        if (value['statusCode'] == 200) {
          // userData = UserDataModel.fromJson(value);
          authStatus = AuthStatus.authenticated;
          // TODO navegacion a home
          // NavigationService.removeUntil(Flurorouter.dashboardRoute);
          // emit(AuthAuthenticatedState(userData));
        } else {
          NotificationServices.showSnackbarMessage(
            message: value['message'] ?? errorServer,
          );
          emit(FinishWithError(error: ''));
        }
      } catch (e) {
        NotificationServices.showSnackbarMessage(
          message: value['message'] ?? errorServer,
        );
        emit(FinishWithError(error: ''));
      }
    }).catchError((e) {
      NotificationServices.showSnackbarMessage(
        message: errorServer,
      );
      emit(FinishWithError(error: e.toString()));
    });
  }

  void _logoutState(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthCheckingState());
    await Future.delayed(Duration(seconds: 1));
    LocalStorage().setToken = '';
    authStatus = AuthStatus.notAuthenticated;
    // userData = UserDataModel.fromJson({});
    // NavigationService.removeUntil(Flurorouter.loginRoute);
    emit(AuthInitialState());
  }

  // Future<void> _sendCodeState(
  //     SendCodeEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoadingState());
  //   try {
  //     //TODO enviar email para recuperacion de contraseña
  //     emit(SuccessSendCodeState());
  //     // await _api.sendCode(email: event.model.email).then((value) {
  //     //   emit(AuthInitialState());
  //     //   if (value['statusCode'] == 200) {
  //     //     authStatus = AuthStatus.notAuthenticated;
  //     //     emit(SuccessSendCodeState());
  //     //   } else {
  //     //     NotificationServices.showSnackbarMessage(
  //     //       message: value['error'],
  //     //     );
  //     //     emit(FinishWithError(error: ''));
  //     //   }
  //     // }).catchError((e) {
  //     //   NotificationServices.showSnackbarMessage(
  //     //     message: e,
  //     //   );
  //     //   emit(FinishWithError(error: e.toString()));
  //     // });
  //   } catch (e) {
  //     NotificationServices.showSnackbarMessage(
  //       message: errorData,
  //     );
  //     emit(FinishWithError(error: errorServer));
  //   }
  // }

  // Future<void> _resetPasswordState(
  //     ResetPasswordEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoadingState());
  //   try {
  //     // Enviar datos para resetear contraseña
  //     authStatus = AuthStatus.notAuthenticated;
  //     // NavigationService.removeUntil(Flurorouter.loginRoute);
  //     emit(ResetPasswordSuccesState());
  //     // await _api.restorePassword(model: event.model).then((value) {
  //     //   emit(AuthInitialState());
  //     //   if (value['statusCode'] == 200) {
  //     //     authStatus = AuthStatus.notAuthenticated;
  //     //     emit(ResetPasswordSuccesState());
  //     //   } else {
  //     //     NotificationServices.showSnackbarMessage(
  //     //       message: value['error'],
  //     //     );
  //     //     emit(FinishWithError(error: ''));
  //     //   }
  //     // }).catchError((e) {
  //     //   NotificationServices.showSnackbarMessage(
  //     //     message: e,
  //     //   );
  //     //   emit(FinishWithError(error: e.toString()));
  //     // });
  //   } catch (e) {
  //     NotificationServices.showSnackbarMessage(
  //       message: errorData,
  //     );
  //     emit(FinishWithError(error: errorServer));
  //   }
  // }
}
