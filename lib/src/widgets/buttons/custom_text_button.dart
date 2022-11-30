import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/utils.dart';
import 'style_buttons.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final CustomButtonColor? color;
  final dynamic icon;
  final PositionIcon? positionIcon;
  final double? radius;
  const CustomTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.icon,
    this.positionIcon,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeButtonColor(color ?? CustomButtonColor.primary),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? defaultBorderRadius),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null && positionIcon == null || positionIcon == PositionIcon.left)
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: icon,
                ),
              Flexible(
                child: Text(
                  text,
                  style: Theme.of(context).primaryTextTheme.button!.copyWith(
                      color: CustomButtonColor.secondaryLigth == color ||
                              CustomButtonColor.secondary == color
                          ? AppColors.secondaryColor
                          : AppColors.primaryColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (icon != null && positionIcon == PositionIcon.right)
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: icon,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
