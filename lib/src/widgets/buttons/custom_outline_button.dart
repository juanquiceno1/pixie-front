import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import 'style_buttons.dart';

class CustomOutLineButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final CustomButtonColor? color;
  const CustomOutLineButton({Key? key, this.onPressed, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeButtonColor(color ?? CustomButtonColor.primary),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
          child: Text(
            text,
            style: Theme.of(context).primaryTextTheme.button!.copyWith(
                  color: CustomButtonColor.secondaryLigth == color ||
                          CustomButtonColor.secondary == color
                      ? AppColors.secondaryColor
                      : AppColors.primaryColor,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
