import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/utils.dart';

class CustomSelectButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isDisabled;
  final int? maxLines;

  const CustomSelectButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled = false,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled
              ? AppColors.secondaryLightColor
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          border: Border.all(
            color: isDisabled
                ? AppColors.secondaryLightColor
                : AppColors.textColor,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.normal,
              ),
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines ?? 1,
        ),
      ),
    );
  }
}
