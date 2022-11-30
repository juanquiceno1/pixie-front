import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class StyleAppBar {
  static double elevateAppBar = 4;

  static Color colorAppBar = AppColors.white;

  static Color shadowColorAppBar = AppColors.hintColor.withOpacity(0.5);

  static RoundedRectangleBorder shapeAppBar = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.elliptical(15, 15),
    ),
  );
}
