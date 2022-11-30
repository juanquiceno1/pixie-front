import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'input_decoration.dart';

enum IconPosition { left, right }

class StyleTextField {
  static InputDecoration inputDecoration({
    required BuildContext context,
    Color? fillColor,
    String? labelText,
    String? hintText,
    String? helperText,
    EdgeInsets? contentPadding,
    bool? isDense,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? AppColors.transparent,
      labelText: labelText,
      hintText: hintText,
      errorMaxLines: 3,
      hoverColor: AppColors.primaryLightColor.withOpacity(0.2),
      hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      helperText: helperText,
      helperStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
      contentPadding: contentPadding,
      isDense: isDense ?? false,
      // suffixIcon: suffixIcon,
      // suffix: suffix,
      // prefixIcon:
      //     prefixIcon != null ? _icon(IconPosition.left, prefixIcon!) : null,
      // prefix: prefix,
      border: DecorationInput().outline(color: AppColors.textColor),
      focusedBorder: DecorationInput().outline(color: AppColors.primaryColor),
      focusedErrorBorder: DecorationInput().outline(
        color: AppColors.red,
      ),
      disabledBorder: DecorationInput().outline(color: AppColors.textColor),
      enabledBorder: DecorationInput().outline(color: AppColors.textColor),
    );
  }

  Widget _icon(IconPosition position, Widget child) {
    return Padding(
      padding: EdgeInsets.only(
          left: position == IconPosition.left ? 8 : 5,
          right: position == IconPosition.right ? 5 : 8),
      child: child,
    );
  }
}
