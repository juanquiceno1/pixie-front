import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../theme/colors.dart';
import '../../utils/utils.dart';
import '../buttons/custom_text_button.dart';
import '../images/custom_image.dart';

class CustomAlertFile extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final void Function()? onPressed;
  final String? buttonCancelText;
  final void Function()? onPressedCancel;

  const CustomAlertFile({
    Key? key,
    this.image,
    this.title,
    this.subtitle,
    this.buttonText,
    required this.onPressed,
    this.buttonCancelText,
    this.onPressedCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultBorderRadius)),
      contentPadding: EdgeInsets.all(0),
      iconPadding: EdgeInsets.zero,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomImage(image: image ?? 'assets/icons/files.svg', height: 60),
          ),
          Transform.translate(
            offset: const Offset(5, -15),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
              ),
            ),
          ),
        ],
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '¿Deseas cambiar tu foto de perfil?',
              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                subtitle!,
                style: Theme.of(context).primaryTextTheme.caption,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Divider(color: AppColors.primaryColor),
          Container(
            height: 1,
            width: double.maxFinite,
            color: AppColors.hintColor,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  text: buttonText ?? 'Ir a galería',
                  icon: CustomImage(
                    image: 'assets/icons/camera.png',
                    height: 20,
                  ),
                  onPressed: onPressed,
                ),
              ),
              Container(
                width: 1,
                height: 50,
                color: AppColors.hintColor,
              ),
              Expanded(
                child: CustomTextButton(
                  text: buttonCancelText ?? 'Ir a cámara',
                  icon: CustomImage(
                    image: 'assets/icons/camera.png',
                    height: 20,
                  ),
                  onPressed: onPressedCancel,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
