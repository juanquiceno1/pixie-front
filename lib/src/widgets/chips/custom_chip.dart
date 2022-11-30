import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/utils.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onPressed;
  final void Function()? onDeleted;
  final Color? colorSide;
  final double? borderRadius;
  final double? elevation;
  final Widget? avatar;
  final String? selected;
  const CustomChip({
    Key? key,
    required this.label,
    this.color,
    this.textColor,
    this.onPressed,
    this.onDeleted,
    this.borderRadius,
    this.elevation,
    this.avatar,
    this.selected,
    this.colorSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Chip(
        labelPadding: const EdgeInsets.all(2.0),
        avatar: avatar,
        side: selected == null
            ? BorderSide.none
            : selected == label
                ? BorderSide.none
                : BorderSide(color: colorSide ?? AppColors.primaryColor),
        backgroundColor: color ?? AppColors.secondaryLightColor,
        label: Text(
          label,
          style: TextStyle(
            color: textColor ?? AppColors.textColor,
          ),
        ),
        deleteIcon: Icon(
          Icons.close,
          color: textColor ?? AppColors.textColor,
        ),
        elevation: elevation ?? 0.0,
        onDeleted: onDeleted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? defaultBorderRadius),
        ),
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }
}
