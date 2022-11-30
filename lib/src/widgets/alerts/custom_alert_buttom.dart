import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../buttons/custom_outline_button.dart';
import '../buttons/custon_elevated_button.dart';
import '../images/custom_image.dart';

class CustomAlertButtom extends StatelessWidget {
  final String image;
  final String title;
  final String? subtitle;
  final String buttonText;
  final void Function()? onPressed;
  final String? buttonCancelText;
  final void Function()? onPressedCancel;

  const CustomAlertButtom({
    Key? key,
    required this.image,
    required this.title,
    this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.buttonCancelText,
    this.onPressedCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultBorderRadius)),
      contentPadding: EdgeInsets.all(0),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CustomImage(image: image, height: 60),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              title,
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
      content: Container(
        margin: const EdgeInsets.only(
            left: defaultPadding, right: defaultPadding, bottom: defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: buttonText,
                    onPressed: onPressed,
                  ),
                ),
                if (buttonCancelText != null) SizedBox(width: 5),
                if (buttonCancelText != null)
                  Expanded(
                    child: CustomOutLineButton(
                      text: buttonCancelText!,
                      onPressed: onPressedCancel,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
