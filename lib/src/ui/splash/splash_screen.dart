import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../theme/colors.dart';
import '../../utils/responsive.dart';
import '../../widgets/alerts/alert_exit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AuthBloc authBloc = AuthBloc();
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).unfocus();
      if (authBloc.state is AuthInitialState) {
        authBloc.add(AuthValidateEvent(context));
      }
    });
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.black26, statusBarBrightness: Brightness.light));
    controller = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    animation = Tween(begin: 0.0, end: 0.9).animate(controller)
      ..addListener(() {
        setState(() {
          /* the state that has changed here is the animation object’s value*/
        });
      });
    controller.forward();
    startTime();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  startTime() async {
    var duration = Duration(milliseconds: 500);
    return Timer(duration, () {});
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => AlertExit(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) async {
            // if (state is AuthAuthenticatedState) {
            //   authBloc.add(AuthInitialEvent());

            //   controller =
            //       AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
            //   animation = Tween(begin: 0.9, end: 1.0).animate(controller)
            //     ..addListener(() {
            //       setState(() {
            //         /* the state that has changed here is the animation object’s value*/
            //       });
            //     });
            //   await controller.forward().then(
            //         (value) => {
            //           // NavigationService.removeUntil(Flurorouter.dashboardRoute)
            //         },
            //       );
            // }
          },
          child: _loading(screenSize),
        ),
      ),
    );
  }

  Widget _loading(Size screenSize) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  height: screenSize.height * 0.2,
                ),
                Container(
                  width: Responsive.isMobile(context)
                      ? screenSize.width * 0.60
                      : screenSize.width * 0.30,
                  margin: const EdgeInsets.only(bottom: 20.0, top: 20),
                  padding: const EdgeInsets.all(0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: LinearProgressIndicator(
                      minHeight: 5.0,
                      value: animation.value,
                      color: AppColors.primaryColor,
                      backgroundColor: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
