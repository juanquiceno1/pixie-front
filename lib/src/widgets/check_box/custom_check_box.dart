import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/utils.dart';

class CustomCheckBox extends StatelessWidget {
  final bool? value;
  final Function(bool?)? onChanged;
  final Color? activeColor;
  const CustomCheckBox({Key? key, this.value, this.onChanged, this.activeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: activeColor ?? AppColors.secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadiusCheck),
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
