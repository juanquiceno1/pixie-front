import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../bloc/notification/notification_bloc.dart';
import '../global_locator.dart';
import '../utils/responsive.dart';
import '../theme/colors.dart';

enum TypeNotification { succes, error, warning, info }

// enum ToastAction { success, error, info, warning }

class NotificationServices {
  static GlobalKey<ScaffoldMessengerState> messegerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarMessage(
      {required String message, TypeNotification? type}) {
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      width: Responsive.isDesktop(messegerKey.currentContext!)
          ? 400
          : Responsive.isTablet(messegerKey.currentContext!)
              ? messegerKey.currentContext!.size!.width * 0.5
              : messegerKey.currentContext!.size!.width * 0.9,
      content: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide.none,
        ),
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: 100,
          decoration: BoxDecoration(
            color: type == TypeNotification.succes
                ? AppColors.green.withOpacity(0.9)
                : type == TypeNotification.warning
                    ? Colors.amber[600]
                    : Colors.red.withOpacity(0.9),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                    type == TypeNotification.succes
                        ? Icons.check_rounded
                        : type == TypeNotification.warning
                            ? Icons.warning_rounded
                            : Icons.info_rounded,
                    color: AppColors.white),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    messegerKey.currentState!.clearSnackBars();
    messegerKey.currentState!.showSnackBar(snackBar);
  }

  static toast(
      {required BuildContext context,
      TypeNotification? toastAction,
      IconData? icon,
      required String description,
      int? timeToast}) {
    global<NotificationBloc>().fToast.init(context);
    Widget toast = FadeInUp(
        delay: Duration(milliseconds: 400),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: toastAction == TypeNotification.succes
                ? AppColors.green.withOpacity(0.9)
                : toastAction == TypeNotification.error
                    ? Colors.red.withOpacity(0.9)
                    : toastAction == TypeNotification.warning
                        ? Color.fromARGB(255, 255, 199, 59)
                        : Color.fromARGB(255, 57, 57, 57),
          ),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Text(
                  description,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
        ));
    global<NotificationBloc>().fToast.showToast(
          child: toast,
          gravity: ToastGravity.BOTTOM,
          toastDuration: Duration(
            seconds: timeToast ?? 3,
          ),
        );
  }
}
