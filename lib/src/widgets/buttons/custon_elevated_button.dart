import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import 'style_buttons.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final CustomButtonColor? color;
  final dynamic icon;
  final PositionIcon? positionIcon;
  const CustomElevatedButton(
      {Key? key, this.onPressed, required this.text, this.color, this.icon, this.positionIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeButtonColor(color ?? CustomButtonColor.primary),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.primaryLightColor;
              }
              return AppColors.primaryColor;
            },
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 12),
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
                          ? AppColors.primaryColor
                          : AppColors.white),
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
