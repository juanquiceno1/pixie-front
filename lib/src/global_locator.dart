import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'api/api_repository.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/notification/notification_bloc.dart';
import 'repository/auth/auth_repository.dart';
import 'services/notification_services.dart';

late GetIt global;

void setUpGlobalLocator() {
  global = GetIt.I;
  global.registerLazySingleton(() => Logger());
  global.registerLazySingleton<NotificationServices>(() => NotificationServices());
  global.registerLazySingleton<NotificationBloc>(() => NotificationBloc());
  global.registerLazySingleton<AuthBloc>(() => AuthBloc());

  global.registerLazySingleton<APIRepository>(() => DefaultAPIRepository());
  global.registerLazySingleton<AuthRepository>(() => AuthDefault());
}
