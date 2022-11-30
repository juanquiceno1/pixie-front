import 'package:flutter/material.dart';

import 'package:material_color_gen/material_color_gen.dart';

import '../../theme/colors.dart';
import '../../utils/utils.dart';

enum CustomButtonColor { primary, primaryLigth, secondary, secondaryLigth }

enum PositionIcon { left, right }

ThemeData themeButtonColor(CustomButtonColor color) {
  return ThemeData(
    primarySwatch: CustomButtonColor.secondary == color
        ? AppColors.secondaryColor.toMaterialColor()
        : CustomButtonColor.secondaryLigth == color
            ? AppColors.secondaryLightColor.toMaterialColor()
            : CustomButtonColor.primaryLigth == color
                ? AppColors.primaryLightColor.toMaterialColor()
                : AppColors.primaryColor.toMaterialColor(),
    primaryColor: CustomButtonColor.secondary == color
        ? AppColors.secondaryColor.toMaterialColor()
        : CustomButtonColor.secondaryLigth == color
            ? AppColors.secondaryLightColor.toMaterialColor()
            : CustomButtonColor.primaryLigth == color
                ? AppColors.primaryLightColor.toMaterialColor()
                : AppColors.primaryColor.toMaterialColor(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
      ),
    ),
  );
}
