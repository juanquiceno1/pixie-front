import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/logger.dart';
import 'src/bloc/auth/auth_bloc.dart';
import 'src/global_locator.dart';
import 'src/observer_bloc.dart';
import 'src/services/local_storage.dart';
import 'src/routes/routes.dart';
import 'src/theme/theme.dart';
import 'src/services/notification_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ObserverBloc();
  setUpGlobalLocator();
  await LocalStorage.configurePrefs();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _logger = global<Logger>();
  bool token = false;

  @override
  void initState() {
    _logger.wtf('App started');
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pixie',
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouters.router,
      scaffoldMessengerKey: NotificationServices.messegerKey,
      theme: lightThemeData,
      // darkTheme: darkThemeData,
      // themeMode: EasyDynamicTheme.of(context).themeMode,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'ES'), // Español
        Locale('en', 'EN'), // Inglés
      ],
      locale: const Locale('es', 'ES'),
    );
  }
}
